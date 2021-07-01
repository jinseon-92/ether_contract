# 이더리움 스마트 컨트랙트


- Solidity
- Base OS: Ubuntu 18.04
- Base Image:  ethereum/solc:0.4.24 
- Docker 설치
- Truffle@4.1.15 



## Smart Contract Compile

#### 이미지 빌드 후 컨트랙트를 컴파일하여 바이너리 코드와 ABI JSON 데이터 확인

```sh
cd sc
sudo docker build -t [image:tag] .
sudo docker run -it --rm [image:tag] --optimize --bin Faucet.sol
sudo docker run -it --rm [image:tag] --abi Faucet.sol
```
---

**함수**

```sh
function FunctionName([parameters]) {public|private|internal|external}
[pure|constant|view|payable] [modifiers] [returns (return types)]
```

###### public : 공개함수(기본값) 다른 컨트랙트 또는 EOA 트랜잭션 또는 컨트랙트 내부에서 호출 가능하다
###### external : 공개함수와 같지만 컨트랙트 내부에서 호출 시 this가 꼭 붙어야 한다
###### internal : 컨트랙트 내부 또는 파생된 컨트랙트에서만 호출 가능하다
###### private : 내부 함수와 유사하지만 파생된 컨트랙트에서도 호출할 수 없다
###### payable : 선언되어 있으면 입금을 받을 수 있는 함수이고, 그렇지 않으면 입금이 거부된다

---

**생성자(constructor)**

```sh
pragma ^0.4.22
contract MEContract {
    constructor () {
    }
}
```

###### 생성자는 컨트랙트 생성 시 실행되며 컨트랙트 상태를 초기화 한 다음 소멸된다

---

**SELFDESTRUCT**

```sh
selfdestruct(address recipient);
```

###### 컨트랙트를 제거할 때 사용하고 인수로 받는 주소는 컨트랙트에 남은 이더를 전송할 주소이다
###### 삭제 가능한 컨트랙트에는 해당 함수를 포함하여 배포해야 하고 그렇지 않으면 포함하지 않아도 된다

---

**함수 변경자(modifier)**

```sh
modifier onlyOwner {
    require(msg.sender == owner);
    _;
}
```

###### 컨트랙트 내 함수에 적용할 여러 조건들을 생성하기 위해 사용한다
###### 변경자를 적용하려면 함수 선언에 변경자 이름을 추가해야 하며 함수에 둘 이상의 변경자를 적용 가능하다

---

**컨트랙트 상속**

```sh
contract Child is Parent {
    ...
}
```

###### 컨트랙트 상속은 is 키워드를 사용하고, Child 컨트랙트가 Parent의 모든 메서드, 기능 및 변수를 상속받는다

---

**예외 처리**

```sh
require(msg.sender == owner, "Only Contract Owner");
```

###### Assert : 결과가 참인지 판단하기 위해 사용함
###### Require : 조건을 만족하지 않는 경우 함수가 실행되지 않는다
###### Revert : 컨트랙트의 실행을 중지하고 모든 변경 상태를 되돌린다

---

**이벤트**

```sh
contract Faucet is mortal {
    event Withdrawal(address indexed to, uint amount);
    [...]
    
    function withdraw(uint withdraw_amount) public {
        [...]
        emit Withdrawal(msg.sender, withdraw_amount);
}
```

###### Event를 통해 트랜잭션 로그에 원하는 정보를 포함시킬 수 있다. 인수 앞에 indexed 키워드를 사용하면 인덱싱 된 해시 테이블 값으로 만들 수 있다 


## Truffle Install

#### NVM Install

```sh
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

command -v nvm         // nvm 출력되면 설치
```

#### Node.js Install

```sh
nvm install --lts
node -v
npm -v
```

#### Truffle 설치

```sh
npm -g install truffle@4.1.15
```

#### Truffle 초기화 & npm 패키지 설치

```sh
mkdir Faucet
cd Faucet
truffle init

Faucet/
├── contracts
│   └── Migrations.sol
├── migrations
│   └── 1_initial_migration.js
├── test
└── truffle-config.js


npm init
npm install dotenv truffle-wallet-provider ethereumjs-wallet

copy sc/faucet.sol Faucet/contracts	# 컨트랙트를 프로젝트 내부 contracts 디렉토리로 복사
```

###### 트러플은 RPC를 통해 로컬 노드와 8545 포트를 이용하여 통신하고, 로컬 노드와 연결된 이더리움 메인 네트워크 또는 롭스텐 테스트 네트워크와 같은 로컬 노드가 연결된 모든 이더리움 네트워크를 사용한다.


