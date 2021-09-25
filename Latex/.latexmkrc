#!/usr/bin/env perl

# LaTeX
$max_repeat = 5;


# PDF
$pdf_previewer = ("start xpdf -remote azd \"openFile(%S)\"");
$pdf_update_method = 4;
$pdf_update_command = "xpdf -remote azd reload";
