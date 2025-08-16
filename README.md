# 環境設定

<br>・homebrewインストール<br>
https://brew.sh

<br>・PATHの通し方と意味<br>
https://blog.kikagaku.co.jp/path
https://amateur-engineer.com/mac-path-zsh/
<br>お使いのmacがzshかbashかで設定が変わってくる<br>
echo $SHELL で確認

<br>・terraformインストール<br>
https://qiita.com/tanamoru/items/196004686a471a3b7e2f

<br>・VScodeを日本語化する<br>
https://www.javadrive.jp/vscode/install/index4.html

<br>・AWSCLIインストール<br>
https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions

<br>・Github組織アカウントの作成方法<br>
https://www.ipentec.com/document/github-create-organization-account

<br>・Gitインストール<br>
https://qiita.com/suke_masa/items/4bed855628f7414293f8

# TERRAFORM関連
<br>・HCLコード参考<br>
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources

<br>・プロファイルの作成と設定<br>
https://www.techpit.jp/courses/125/curriculums/128/sections/939/parts/3609

<br>・AWS CLIでAWS Account IDを取得する。<br>
https://qiita.com/kooohei/items/2a8a09e5f36bac614879

<br>・terraformの基本<br>
https://qiita.com/kimuni-i/items/6298ed10adc6ad450488

https://zenn.dev/himekoh/articles/202208191916

<br>・Terraformへの変数の渡し方<br>
https://capsulecloud.io/terraform-variable

<br>。workspaceの作成<br>
https://zenn.dev/naonao70/articles/9fdca68268898c

<br>feature作業中に、developの最新内容を取り入れる<br>
<br>developにチェックアウト<br>
<br>・git checkout develop<br>
<br>最新にする<br>
<br>・git pull origin develop<br>
<br>作業ブランチにチェックアウト<br>
<br>・git checkout feature-XX-XX<br>
<br>developの内容を取り込む<br>
<br>・git rebase develop<br>

<br>その場でコンフリクトが起きた場合、解消作業する→その後、git rebase --continue<br>

<br>それをプッシュする<br>
<br>・git push origin feature-XX-XX -f<br>


# VPC作成

<br>VPC作成<br>
<br>サブネットを１つ作成<br>
<br>ルートテーブルを作成<br>
<br>インターネットゲートウェイ作成<br>
<br>ルートテーブルとインターネットゲートウェイの紐付け<br>
https://kacfg.com/terraform-vpc-ec2/


# tfstateではなくS3で管理するためそのS3の作成
<br>・StateファイルをS3へ移行<br>
https://qiita.com/m-oka-system/items/bba8d32d57142a870ce5
https://qiita.com/sinshutu/items/7d3cc7438871c50ea63c

<br>stateを格納するS3もterraformから作成する場合、バックエンドの設定を取り除き、<br>
<br>resource "aws_s3_bucket"でs3を作成する文言を先にアプライした後、バックエンドの設定をし、initする<br>
<br>→詳細は　エラー対処　の2番へ<br>

# LFSを使ってGit容量削減
<br>・Gitに大容量ファイルをプッシュするときには”Git LFS”を利用しよう<br>
https://genzouw.com/entry/2022/02/09/112150/2934/

# エラー対処
<br>1.terraform -versionで "Version could not be resolved" が発生する<br>
https://capsulecloud.io/terraform-variable

<br>2.Error: Failed to get existing workspaces: S3 bucket does not exist.が発生する<br>
https://qiita.com/ryo-sato/items/2bc7438077c567c178e5

# gitignoreを使い公開しない情報、gitで管理しないもの、容量の大きいものを追加
<br>ルートディレクトリに.gitignoreを作成しておく<br>
<br>$ cd {リポジトリパス}<br>

<br>$ touch .gitignore<br>

<br>.gitignoreにgit管理対象から外したいファイルを記載する<br>
<br>$ vi .gitignore<br>

<br>iを押下して(insert)モードにする<br>
<br>ファイル記載する<br>
<br>ファイルを記載し終えたら、esc→:wqで保存して終了する<br>

YUJINAGAAOKA

terraformでこの内容を取り込みながら新しい変更をマージする
terraformでこの内容を取り込みながら新しい変更をマージする
terraformでこの内容を取り込みながら新しい変更をマージする
terraformでこの内容を取り込みながら新しい変更をマージする
