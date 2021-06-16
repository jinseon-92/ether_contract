# 이더리움 스마트 컨트랙트


- Base OS: Ubuntu 18.04
- Base Image:  ethereum/solc:0.4.24 
- Docker 설치



## Smart Contract Compile

 * 이미지 빌드 후 컴파일하여 바이너리 코드와 ABI JSON 데이터 확인

```sh
cd sc
sudo docker build -t [image:tag]
sudo docker run -it --rm [image:tag] --optimize --bin Faucet.sol
sudo docker run -it --rm [image:tag] --abi Faucet.sol
```

 * 함수 구문

```sh
function FunctionName([parameters]) {public|private|internal|external}
[pure|constant|view|payable] [modifiers] [returns (return types)]
```
