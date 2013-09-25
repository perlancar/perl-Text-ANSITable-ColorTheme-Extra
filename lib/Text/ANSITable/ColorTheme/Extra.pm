package Text::ANSITable::ColorTheme::Extra;

use 5.010001;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rgb2grayscale rgb2sepia reverse_rgb_color);
use SHARYANTO::ColorTheme::Util qw(create_color_theme_transform);
require Text::ANSITable;

# VERSION

my $defct = Text::ANSITable->get_color_theme("Default::default_gradation");

our %color_themes = ();

{
    my $ct = create_color_theme_transform($defct, sub { rgb2grayscale(shift) });
    $ct->{summary} = 'Grayscale';
    $color_themes{grayscale} = $ct;
}

{
    my $ct = create_color_theme_transform($defct, sub { rgb2sepia(shift) });
    $ct->{summary} = 'Sepia tone';
    $color_themes{sepia} = $ct;
}

{
    my $ct = create_color_theme_transform($defct, sub { reverse_rgb_color(shift) });
    $ct->{summary} = 'Reverse';
    $color_themes{reverse} = $ct;
}

1;
# ABSTRACT: More color themes
