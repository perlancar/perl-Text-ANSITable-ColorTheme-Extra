package Text::ANSITable::ColorTheme::Tint;

use 5.010;
use strict;
use warnings;

use Data::Clone;
use SHARYANTO::Color::Util qw(tint_rgb_color);
use SHARYANTO::ColorTheme::Util qw(create_color_theme_transform);
require Text::ANSITable;

# VERSION

our %color_themes = ();

my $defct = Text::ANSITable->get_color_theme("Default::default_gradation");
$defct->{colors}{str_data} = '7f7f7f';

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ff0000')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Red-tinted (50%)';
    $color_themes{tint_red} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ff8000')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Orange-tinted (50%)';
    $color_themes{tint_orange} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ffff00')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Yellow-tinted (50%)';
    $color_themes{tint_yellow} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '00ff00')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Green-tinted (50%)';
    $color_themes{tint_green} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '0000ff')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Blue-tinted (50%)';
    $color_themes{tint_blue} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, 'ff00ff')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Magenta-tinted (50%)';
    $color_themes{tint_magenta} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '00ffff')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Cyan-tinted (50%)';
    $color_themes{tint_cyan} = $ct;
}

{
    my $ct = create_color_theme_transform(
        $defct, sub {tint_rgb_color(shift, '000000')});
    $ct->{v} = 1.1;
    $ct->{summary} = 'Black-tinted (50%)';
    $color_themes{tint_black} = $ct;
}

1;
# ABSTRACT: Several tinted color themes
