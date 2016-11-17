my $url = 'https://sites.google.com/a/nirmauni.ac.in/ce653---advance-data-structures-even-2016/';
my $html = qx{wget --quiet --output-document=- $url};
print $html;
if (index($html, "ssignment") != -1) {
    print "$str contains assignment\n";
} 
