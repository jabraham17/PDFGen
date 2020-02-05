ENV=env
PYTHON=$(ENV)/bin/python
PIP=$(ENV)/bin/pip
PYINSTALL=$(ENV)/bin/pyinstaller
TARGET=pdfgen
MAIN=main.py

GREEN=\033[0;32m
RED=\033[0;31m
COLOR_OFF=\033[0m

all: loadLibs
	@if [ -f $(TARGET).spec ] ; \
	then \
		echo "$(GREEN)Building from spec file$(COLOR_OFF)"; \
		$(PYINSTALL) $(TARGET).spec; \
	else \
		echo "$(GREEN)Building spec file$(COLOR_OFF)"; \
		$(PYINSTALL) --onefile --name $(TARGET) $(MAIN); \
	fi; \

	rm -f $(TARGET)
	ln -s dist/$(TARGET) $(TARGET)

run: loadLibs
	$(PYTHON) $(MAIN)

# save external libs in requirements.txt
saveLibs: mkEnv
	@echo "$(GREEN)Saving libs to requirements.txt$(COLOR_OFF)"
	./$(PIP) -q freeze > requirements.txt
	@echo "$(GREEN)Done$(COLOR_OFF)"

# load external libs
loadLibs: mkEnv
	@echo "$(GREEN)Loading libs from requirements.txt$(COLOR_OFF)"
	./$(PIP) -q install -r requirements.txt
	@echo "$(GREEN)Done$(COLOR_OFF)"

# creates python envirmoent
mkEnv:
	@if [ command -v virtualenv >/dev/null 2>&1 ] ; \
	then \
		echo "$(RED)virtualenv needs to be installed$(COLOR_OFF)"; \
	else \
		if [ ! -d $(ENV) ] ; \
		then \
			echo "$(GREEN)Creating $(ENV)$(COLOR_OFF)"; \
			virtualenv -q --python=python3.6 $(ENV); \
			echo "$(GREEN)Done$(COLOR_OFF)"; \
		else \
			echo "$(GREEN)$(ENV) already exists$(COLOR_OFF)"; \
		fi; \
	fi; \



.PHONY: clean
clean:
	@echo "$(GREEN)Cleaning......$(COLOR_OFF)"
	rm -rf __pycache__
	rm -rf build
	rm -rf dist
	rm -rf $(TARGET)
	@echo "$(GREEN)Done$(COLOR_OFF)"

.PHONY: cleanEnv
cleanEnv:
	@echo "$(GREEN)Cleaning $(ENV)......$(COLOR_OFF)"
	rm -rf $(ENV)
	@echo "$(GREEN)Done$(COLOR_OFF)"

.PHONY: cleanAll
cleanAll: clean cleanEnv