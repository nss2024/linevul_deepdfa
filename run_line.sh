#!/bin/bash


echo "설치 진행중..."

git clone https://github.com/ISU-PAAL/DeepDFA.git

wget https://github.com/joernio/joern/releases/download/v1.1.1072/joern-cli.zip

unzip joern-cli.zip -d joern-cli

export PATH=$PATH:/content/joern-cli/joern-cli

pip install pip==23.2.1

pip install tqdm numpy pandas torch==1.12 "torchmetrics<0.10.0" torchsampler silence-tensorflow tensorflow scipy captum deepspeed scikit-learn tokenizers transformers tree-sitter unidiff jsonlines networkx pexpect jsonargparse fastparquet gdown nni

pip install -f https://data.dgl.ai/wheels/cu117/repo.html "dgl<1.1.3"

pip install pytorch-lightning==1.7.7

apt-get install openjdk-11-jdk-headless -qq > /dev/null

pip install virtualenv

apt-get install cuda-11-7






## 이 부분은 안 덮어 씌워질 수 있음 (확인필요)
git clone https://github.com/nss2024/linevul_deepdfa.git
rsync -av linevul_deepdfa/DDFA/ DeepDFA/DDFA/
rsync -av linevul_deepdfa/LineVul/ DeepDFA/LineVul/

rm -rf linevul_deepdfa/
echo "청소중.."
rm -rf DDFA/
rm -rf LineVul/
rm -rf /content/sample_data
rm /content/joern-cli.zip
rm -rf /content/DeepDFA/CodeT5
rm -rf /content/DeepDFA/scripts
rm /content/DeepDFA/Dockerfile
rm /content/DeepDFA/LICENSE
rm /content/DeepDFA/README.md
rm /content/DeepDFA/environment.yml
rm /content/DeepDFA/paper.pdf

pip install -U 'jsonargparse[signatures]'


# 훈련
#cd /content/DeepDFA/LineVul/linevul/
#bash scripts/msr_train_combined.sh 1 MSR



# 데이터셋 학습시키는 코드
# 다운로드 (test val train 은 google drive 에 mnt 되어 있다고 판단)
#curl -Lo preprocessed_data.zip 'https://figshare.com/ndownloader/files/43991910'
#unzip preprocessed_data.zip
#rm preprocessed_data.zip
#rsync -av DDFA/ DeepDFA/DDFA/
#rm -rf DDFA
#curl -Lo MSR_data_cleaned.zip 'https://figshare.com/ndownloader/files/43990908'
#unzip MSR_data_cleaned.zip
#rm MSR_data_cleaned.zip
#mv MSR_data_cleaned.csv DeepDFA/DDFA/storage/external
#rm MSR_data_cleaned.csv
