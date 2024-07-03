# Makefile for rendering the website
SHELL := pwsh.exe

# Define the output directory
OUTPUT_DIR := _site
OUTPUT_DIR2 := _site-pretuto
FREEZE_DIR := _freeze
EXERCISES_DIR := exercises
EXERCISES_ZIP := $(EXERCISES_DIR).zip
CORRECTON_DIR := examples-correction
CORRECTON_ZIP := $(CORRECTON_DIR).zip

# Define the render command
QUARTO_CMD := quarto
RENDER_CMD := $(QUARTO_CMD) render
PREVIEW_CMD := $(QUARTO_CMD) preview
PUBLISH_CMD := $(QUARTO_CMD) publish quartopub
PWSH_CMD := pwsh.exe -Command

# Define the target for rendering all the website
all: README.md tuto zip

README.md: _README.qmd
	$(RENDER_CMD) _README.qmd

# Render the pre tutorial website
pretuto:
	$(RENDER_CMD) --profile pretuto

publish-pretuto:
	$(PUBLISH_CMD) --profile pretuto

# Render the pre tutorial website
tuto:
	$(RENDER_CMD)

publish-tuto:
	$(PUBLISH_CMD)

# Define the clean target
clean: clean-output clean-freeze

clean-output:
ifeq ($(OS),Windows_NT)
		$(PWSH_CMD) "if (Test-Path $(OUTPUT_DIR)) { Remove-Item -Recurse -Force $(OUTPUT_DIR) }"
		$(PWSH_CMD) "if (Test-Path $(OUTPUT_DIR2)) { Remove-Item -Recurse -Force $(OUTPUT_DIR2) }"
else
		[ -d $(OUTPUT_DIR) ] && rm -rf $(OUTPUT_DIR) || true
		[ -d $(OUTPUT_DIR2) ] && rm -rf $(OUTPUT_DIR2) || true
endif

clean-freeze:
ifeq ($(OS),Windows_NT)
		$(PWSH_CMD) "if (Test-Path $(FREEZE_DIR)) { Remove-Item -Recurse -Force $(FREEZE_DIR) }"
else
		[ -d $(FREEZE_DIR) ] && rm -rf $(FREEZE_DIR) || true
endif

zip: zip-exercises zip-correction

zip-exercises:  $(EXERCISES_DIR)
ifeq ($(OS),Windows_NT)
	$(PWSH_CMD) "if (Test-Path $(EXERCISES_ZIP)) { Remove-Item $(EXERCISES_ZIP) }"
	$(PWSH_CMD) "Compress-Archive -Path $(EXERCISES_DIR)/* -DestinationPath $(EXERCISES_ZIP)"
else
	[ -f $(EXERCISES_ZIP) ] && rm $(EXERCISES_ZIP) || true
	zip -r $(EXERCISES_ZIP) $(EXERCISES_DIR)
endif

$(EXERCISES_DIR):
	@true

zip-correction:  $(CORRECTON_DIR)
ifeq ($(OS),Windows_NT)
	$(PWSH_CMD) "if (Test-Path $(CORRECTON_ZIP)) { Remove-Item $(CORRECTON_ZIP) }"
	$(PWSH_CMD) "Compress-Archive -Path $(CORRECTON_DIR)/* -DestinationPath $(CORRECTON_ZIP)"
else
	[ -f $(CORRECTON_ZIP) ] && rm $(CORRECTON_ZIP) || true
	zip -r $(CORRECTON_ZIP) $(CORRECTON_DIR)
endif

$(CORRECTON_DIR):
	@true