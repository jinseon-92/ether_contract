# 이더리움 스마트 컨트랙트


- Base OS: Ubuntu 18.04
- Base Image:  ethereum/solc:0.4.24 
- Docker 설치



## Smart Contract Compile

#### 이미지 빌드 후 컴파일하여 바이너리 코드와 ABI JSON 데이터 확인

```sh
cd sc
sudo docker build -t [image:tag]
sudo docker run -it --rm [image:tag] --optimize --bin Faucet.sol
sudo docker run -it --rm [image:tag] --abi Faucet.sol
```

**함수 구문**

```sh
function FunctionName([parameters]) {public|private|internal|external}
[pure|constant|view|payable] [modifiers] [returns (return types)]
```

###### public : 공개함수(기본값) 다른 컨트랙트 또는 EOA 트랜잭션 또는 컨트랙트 내부에서 호출 가능하다
###### external : 공개함수와 같지만 컨트랙트 내부에서 호출 시 this가 꼭 붙어야 한다
###### internal : 컨트랙트 내부 또는 파생된 컨트랙트에서만 호출 가능하다
###### private : 내부 함수와 유사하지만 파생된 컨트랙트에서도 호출할 수 없다
###### payable : payable이 선언되어 있으면 입금을 받을 수 있는 함수고, 그렇지 않으면 입금이 거부된다

