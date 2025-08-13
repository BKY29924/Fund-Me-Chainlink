# Load biến môi trường từ .env (nếu có)
-include .env

# Mặc định target khi chạy 'make'
.DEFAULT_GOAL := help

# Khai báo các target luôn chạy, bỏ qua kiểm tra file tồn tại
.PHONY: build test anvil deploy-local deploy-sepolia logs help

# ==========================
# LỆNH CƠ BẢN
# ==========================

## Build smart contract
build: ## Compile contracts
	forge build

## Chạy test
test: ## Run tests
	forge test -vvvv

## Chạy local node Anvil
anvil: ## Start local Anvil node
	anvil

# ==========================
# DEPLOY
# ==========================

## Deploy lên local Anvil
deploy-local: ## Deploy to local Anvil
	forge script script/DeployFundMe.s.sol:DeployFundMe \
		--rpc-url http://127.0.0.1:8545 \
		--private-key $(LOCAL_PRIVATE_KEY) \
		--broadcast -vvvv

## Deploy lên Sepolia
deploy-sepolia: ## Deploy to Sepolia
	forge script script/DeployFundMe.s.sol:DeployFundMe \
		--rpc-url $(SEPOLIA_RPC_URL) \
		--private-key $(SEPOLIA_PRIVATE_KEY) \
		--broadcast --verify \
		--etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

# ==========================
# TIỆN ÍCH
# ==========================

## Xem log
logs: ## View Anvil logs
	tail -f anvil.log

## Xem trợ giúp
help: ## Show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
