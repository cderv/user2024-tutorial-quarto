# Makefile for rendering the website
SHELL := pwsh.exe

# Define the output directory
OUTPUT_DIR := _site
FREEZE_DIR := _freeze

# Define the render command
QUARTO_CMD := quarto
RENDER_CMD := $(QUARTO_CMD) render
PREVIEW_CMD := $(QUARTO_CMD) preview
PWSH_CMD := pwsh.exe -Command

# Define the target for rendering all the website
all:
	$(RENDER_CMD)

# Render the pre tutorial website
pretuto:
	$(RENDER_CMD) --profile pretuto

# Define the clean target
clean: clean-output clean-freeze

clean-output:
ifeq ($(OS),Windows_NT)
		$(PWSH_CMD) "if (Test-Path $(FREEZE_DIR)) { Remove-Item -Recurse -Force $(OUTPUT_DIR) }"
else
		[ -d $(OUTPUT_DIR) ] && rm -rf $(OUTPUT_DIR) || true
endif

clean-freeze:
ifeq ($(OS),Windows_NT)
		$(PWSH_CMD) "if (Test-Path $(FREEZE_DIR)) { Remove-Item -Recurse -Force $(FREEZE_DIR) }"
else
		[ -d $(FREEZE_DIR) ] && rm -rf $(FREEZE_DIR) || true
endif
