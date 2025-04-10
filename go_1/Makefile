.PHONY: check-go

check-go:
	@echo "Checking OS version..."
	@if grep -q "Ubuntu 22" /etc/os-release; then \
		echo "Ubuntu 22 detected."; \
	else \
		echo "This Makefile is intended for Ubuntu 22. Exiting."; \
		exit 1; \
	fi

	@echo "Checking if Go is installed..."
	@if command -v go >/dev/null 2>&1; then \
		echo "Go is already installed at $$(which go)"; \
	else \
		echo "Installing Go..."; \
		sudo apt update && sudo apt install -y golang-go; \
		echo "Go installed at $$(which go)"; \
	fi
