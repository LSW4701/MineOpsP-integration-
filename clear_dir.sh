#!/bin/bash 
#: Title   :MineOps EKS create script
#: Date :2022-10-20
#: Author : LSW <pro_4701@naver.com>
#: Version  : 1.1
#: Description : : Hi

echo "============================================"
echo " create MineOps EKS create script  "
echo " 해당파일은 스크립트 실행전 테라폼 상태저장소를 지우는 스크립트 입니다."
echo " EKS를 만들고 싶으시면 현재경로에서 sh creat.sh 를 수행하세요."
date +%Y-%m-%d




DIR="$( cd "$( dirname "$0" )" && pwd -P )"
echo $DIR

cd $DIR/env/terraform-aws-ubuntu/network ; 
rm -rf .terraform .terraform.lock.hcl

cd $DIR/env/ec2/ec2-instance ; 
rm -rf .terraform .terraform.lock.hcl

cd $DIR/env/terraform-eks/3-irsa ; 
rm -rf .terraform .terraform.lock.hcl