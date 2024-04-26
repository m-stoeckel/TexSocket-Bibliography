param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,
    [string]$OutputFile = ""
) 
if ($OutputFile) {} else {
    $date = Get-Date -Format 'yyyyMMddHHmmss';
    $OutputFile = "bib-$date.png";
}
pdflatex -interaction=nonstopmode -shell-escape "$InputFile";
biber --output-safechars "$InputFile";
pdflatex -interaction=nonstopmode -shell-escape "$InputFile";
pdflatex -interaction=nonstopmode -shell-escape "$InputFile";
magick -density 600 "$InputFile.pdf" -trim "$OutputFile"