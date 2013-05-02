package Text::ANSITable::ColorTheme::Duotone;

use 5.010001;
use strict;
use warnings;

require Text::ANSITable::ColorTheme::Default;
require Text::ANSITable::ColorThemeUtil;

# VERSION

my $defct = $Text::ANSITable::ColorTheme::Default::color_themes{default_gradation};

our %color_themes = ();

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb(
        $defct, sub {
            Text::ANSITable::ColorThemeUtil::modify_rgb_weights(
                shift,
                0.4, 0.3, 0.2,
                0.3, 0.8, 0.4,
                0.3, 0.5, 0.1,
            )});
    $ct->{summary} = 'Duotone green 1';
    $color_themes{duotone_green1} = $ct;
}

{
    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb(
        $defct, sub {
            Text::ANSITable::ColorThemeUtil::modify_rgb_weights(
                shift,
                0.1, 0.3, 0.1,
                0.2, 0.5, 0.3,
                0.4, 0.7, 0.3,
            )});
    $ct->{summary} = 'Duotone cyan 1';
    $color_themes{duotone_cyan1} = $ct;
}

{
    # this can be run several times to see which ones produce some nice output,
    # and be used to create new color themes

    my $ct = Text::ANSITable::ColorThemeUtil::derive_theme_transform_rgb(
        $defct, sub {
            state $fr1 = rand();
            state $fg1 = rand();
            state $fb1 = rand();
            state $fr2 = rand();
            state $fg2 = rand();
            state $fb2 = rand();
            state $fr3 = rand();
            state $fg3 = rand();
            state $fb3 = rand();
            Text::ANSITable::ColorThemeUtil::modify_rgb_weights(
                shift,
                $fr1, $fg1, $fb1,
                $fr2, $fg2, $fb2,
                $fr3, $fg3, $fb3,
            )});
    $ct->{summary} = 'Random tone on every run';
    $color_themes{random_tone1} = $ct;
}

1;
# ABSTRACT: Several duotone color themes

=head1 DESCRIPTION

