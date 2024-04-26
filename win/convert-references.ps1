param(
    [string]$OutputFile = ""
) 
if ($OutputFile) {} else {
    $date = Get-Date -Format 'yyyyMMddHHmmss';
    $OutputFile = "bib-$date.png";
}

magick -density 600 main.pdf -trim "$OutputFile"