all: resume.pdf

clean:
	rm resume.json resume.pdf resume_tmp.typ

resume.pdf: resume_tmp.typ template.typ
	typst compile $$fontPaths resume_tmp.typ resume.pdf

resume_tmp.typ: main.typ resume.json
	echo "" | pandoc -f typst -t typst --template main.typ $$configStr -o resume_tmp.typ

resume.json: resume.pkl projects.pkl
	$$pkl eval -f json resume.pkl -o resume.json
