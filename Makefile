
ANVIL_RPC_URL = http://127.0.0.1:8545
ANVIL_PRIVATE_KEY = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80


build:; forge build 
# 部署本地合约
deploy:
		forge create src/Fundme.sol:Fundme --rpc-url $(ANVIL_RPC_URL) --private-key $(ANVIL_PRIVATE_KEY) --broadcast