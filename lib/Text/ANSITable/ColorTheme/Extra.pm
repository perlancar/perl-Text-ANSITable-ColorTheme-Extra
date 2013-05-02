package Text::ANSITable::ColorTheme::Extra;

use 5.010001;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rgb2grayscale rgb2sepia reverse_rgb_color);
require Text::ANSITable::ColorTheme::Default;
require Text::ANSITable::ColorThemeUtil;

# VERSION

my $defct = $Text::ANSITable::ColorTheme::Default::color_themes{default_gradation};

our %color_themes = ();

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb($defct, sub { rgb2grayscale(shift) });
    $ct->{summary} = 'Grayscale';
    $color_themes{grayscale} = $ct;
}

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb($defct, sub { rgb2sepia(shift) });
    $ct->{summary} = 'Sepia tone';
    $color_themes{sepia} = $ct;
}

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb($defct, sub { reverse_rgb_color(shift) });
    $ct->{summary} = 'Reverse';
    $color_themes{reverse} = $ct;
}

1;
# ABSTRACT: More color themes
