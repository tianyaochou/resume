all: resume.pdf

clean:
	rm resume.json projects.json resume.pdf resume_tmp.typ

resume.pdf: resume_tmp.typ template.typ
	typst compile $$fontPaths resume_tmp.typ resume.pdf

resume_tmp.typ: main.typ resume.json projects.json
	echo "" | pandoc -f typst -t typst --template main.typ $$configStr -o resume_tmp.typ

resume.json: resume.pkl
	$$pkl eval -f json resume.pkl -o resume.json

projects.json: projects.pkl
	$$pkl eval -f json projects.pkl -o projects.json
