@echo off
REM Build paper.pdf from paper.tex (Windows)
REM Usage: build.bat [engine]   engine = pdflatex (default) | xelatex

setlocal
set ENGINE=%1
if "%ENGINE%"=="" set ENGINE=pdflatex
set NAME=paper

echo ==^> pass 1/4: %ENGINE%
%ENGINE% -interaction=nonstopmode %NAME%
echo ==^> pass 2/4: bibtex
bibtex %NAME%
echo ==^> pass 3/4: %ENGINE%
%ENGINE% -interaction=nonstopmode %NAME%
echo ==^> pass 4/4: %ENGINE%
%ENGINE% -interaction=nonstopmode %NAME%

if exist %NAME%.pdf (
  echo ==^> done: %NAME%.pdf
) else (
  echo error: %NAME%.pdf was not produced; see %NAME%.log
  exit /b 1
)

endlocal
