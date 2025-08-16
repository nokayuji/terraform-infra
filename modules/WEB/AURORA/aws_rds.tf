#AURORAクラスター
resource "aws_rds_cluster" "aurora" {
  cluster_identifier              = "${var.env}-db-cluster-postgresql"
  engine                          = "aurora-postgresql"
  engine_mode                     = "provisioned"
  engine_version                  = var.engine_version
  allow_major_version_upgrade     = false
  availability_zones              = var.availability_zones
  database_name                   = var.name
  master_username                 = var.env
  master_password                 = aws_ssm_parameter.db_master_password.value
  backup_retention_period         = var.backup_retention_period #バックアップ保存期間
  preferred_backup_window         = var.preferred_backup_window #バックアップが実行される毎日の時間範囲
  copy_tags_to_snapshot           = true                        #すべてのクラスターをtagsスナップショットにコピー
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora.name
  db_subnet_group_name            = aws_db_subnet_group.aurora.name
  vpc_security_group_ids          = [aws_security_group.aurora.id]
  deletion_protection             = true #削除保護
  skip_final_snapshot             = true #DB クラスターが削除される前に最終的な DB スナップショットを作成するかどうかを決定します。 true を指定した場合、DB スナップショットは作成されません。 false を指定した場合、DB クラスターが削除される前に、 の値を使用して DB スナップショットが作成されます
  apply_immediately               = true
  storage_encrypted               = true #DB クラスターを暗号化するかどうかを指定
  preferred_maintenance_window    = var.preferred_maintenance_window

  tags = {
    name = "${var.env}-db-cluster-postgresql"
  }

  lifecycle {
    ignore_changes = [availability_zones]
  }
}

# Writerインスタンス
resource "aws_rds_cluster_instance" "aurora" {
  count                        = var.rds_instance_count
  identifier                   = "${var.env}-db-instance-${format("%02d", count.index + 1)}"
  cluster_identifier           = aws_rds_cluster.aurora.id #必須
  instance_class               = var.instance_class
  engine                       = aws_rds_cluster.aurora.engine
  engine_version               = aws_rds_cluster.aurora.engine_version
  auto_minor_version_upgrade   = false                            #マイナー エンジン アップグレードがメンテナンス期間中に DB インスタンスに自動的に適用される
  preferred_maintenance_window = var.preferred_maintenance_window # メンテナンスを実行するウィンドウ
  copy_tags_to_snapshot        = true
  ca_cert_identifier           = "rds-ca-rsa2048-g1" #DB インスタンスの CA 証明書の識別子
  db_subnet_group_name         = aws_db_subnet_group.aurora.name
  apply_immediately            = true
  promotion_tier               = 0 #デフォルトは 0。インスタンス レベルのフェイルオーバー優先度設定。ティアが低いリーダーほど、ライターに昇格する優先度が高くなります

  tags = {
    Cluster        = aws_rds_cluster.aurora.id
    InstanceNumber = format("%02d", count.index + 1)
  }
}

#パラメータグループ(DBクラスター)
resource "aws_rds_cluster_parameter_group" "aurora" {
  name   = "${var.env}-db-cluster-pg"
  family = "aurora-postgresql16" #必須 DB クラスターパラメーターグループのファミリー

  parameter {
    name         = "timezone"   #必須
    value        = "Asia/Tokyo" #必須
    apply_method = "immediate"
  }

  tags = {
    Name = "${var.env}-db-cluster-pg"
  }
}

#DBサブネットグループ
resource "aws_db_subnet_group" "aurora" {
  name       = "${var.env}-db-subnet-group"
  subnet_ids = var.subnet_ids #必須

  tags = {
    Name = "${var.env}-db-subnet-group"
  }
}
