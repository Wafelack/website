PREPROCESSOR=sass
SCSS_FOLDER=scss
CSS_FOLDER=build
SCSS_FILES=$(SCSS_FOLDER)/master.scss

build : $(SCSS_FILES)
	$(PREPROCESSOR) $(SCSS_FOLDER)/master.scss $(CSS_FOLDER)/master.css	
