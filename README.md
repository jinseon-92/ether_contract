# 이더리움 스마트 컨트랙트


- ethereum/solc:0.4.24 Base 이미지
- Docker 설치



## Smart Contract Compile

```sh
cd sc
sudo docker build -t [image:tag]
sudo docker run -it --rm [image:tag] --optimize --bin Faucet.sol
```
