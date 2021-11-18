#!/usr/bin/env perl

# LaTeX
$max_repeat = 5;
my $id = int(rand(100));

# PDF
$pdf_previewer = ("start xpdf -remote $id \"openFile(%S)\"");
$pdf_update_method = 4;
$pdf_update_command = "xpdf -remote $id reload";
