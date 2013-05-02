package Text::ANSITable::ColorTheme::Extra;

use 5.010001;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rgb2grayscale rgb2sepia);
use Text::ANSITable::ColorTheme::Default ();

# VERSION

my $defct = $Text::ANSITable::ColorTheme::Default::color_themes{default_gradation};

our %color_themes = ();

# create a new derived theme from a based theme by applying transforms to its
# RGB values (ANSI colors are passed unchanged).
sub derive_theme_transform_rgb {
    my ($basect, $func) = @_;

    my $derivedct = {};

    for my $cn (keys %{ $basect->{colors} }) {
        my $cv = $basect->{colors}{$cn};

        if ($cv) {
            $derivedct->{colors}{$cn} = sub {
                my ($self, %args) = @_;
                my $basec = $basect->{colors}{$cn};
                if (ref($basec) eq 'CODE') {
                    $basec = $basec->($self, name=>$cn, %args);
                }
                if ($basec) {
                    if (ref($basec) eq 'ARRAY') {
                        $basec = [map {defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? $func->($_) : $_} @$basec];
                    } else {
                        for ($basec) {
                            $_ = defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? $func->($_) : $_;
                        }
                    }
                }
                return $basec;
            };
        } else {
            #$derivedct->{colors}{$cn} = $cv;
        }
    }
    $derivedct;
}

{
    my $ct = derive_theme_transform_rgb($defct, sub { rgb2grayscale(shift) });
    $ct->{summary} = 'Grayscale';
    $color_themes{grayscale} = $ct;
}

{
    my $ct = derive_theme_transform_rgb($defct, sub { rgb2sepia(shift) });
    $ct->{summary} = 'Sepia tone';
    $color_themes{sepia} = $ct;
}

1;
# ABSTRACT: More color themes
