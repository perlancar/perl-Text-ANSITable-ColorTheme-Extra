package Text::ANSITable::ColorTheme::Extra;

use 5.010001;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rgb2grayscale rgb2sepia);
use Text::ANSITable::ColorTheme::Default ();

# VERSION

my $defct = $Text::ANSITable::ColorTheme::Default::color_themes{default_gradation};

our %color_themes = ();

# TODO: extract common routine, e.g. derive_theme_transform_rgb($basect, sub { rgb2grayscale(shift) });

# by default it grayscales the 'default_gradation' theme
{
    my $grayct = {
        summary => 'Grayscale',
    };
    my $basect = $defct;
    for my $cn (keys %{ $basect->{colors} }) {
        my $cv = $basect->{colors}{$cn};

        if ($cv) {
            $grayct->{colors}{$cn} = sub {
                my ($self, %args) = @_;
                my $basec = $basect->{colors}{$cn};
                if (ref($basec) eq 'CODE') {
                    $basec = $basec->($self, name=>$cn, %args);
                }
                if ($basec) {
                    if (ref($basec) eq 'ARRAY') {
                        $basec = [map {defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? rgb2grayscale($_) : $_} @$basec];
                    } else {
                        for ($basec) {
                            $_ = defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? rgb2grayscale($_) : $_;
                        }
                    }
                }
                return $basec;
            };
        } else {
            #$grayct->{colors}{$cn} = $cv;
        }
    }
    $color_themes{grayscale} = $grayct;
}

# by default it sepias the 'default_gradation' theme
{
    my $sepiact = {
        summary => 'Sepia tone',
    };
    my $basect = $defct;
    for my $cn (keys %{ $basect->{colors} }) {
        my $cv = $basect->{colors}{$cn};

        if ($cv) {
            $sepiact->{colors}{$cn} = sub {
                my ($self, %args) = @_;
                my $basec = $basect->{colors}{$cn};
                if (ref($basec) eq 'CODE') {
                    $basec = $basec->($self, name=>$cn, %args);
                }
                if ($basec) {
                    if (ref($basec) eq 'ARRAY') {
                        $basec = [map {defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? rgb2sepia($_) : $_} @$basec];
                    } else {
                        for ($basec) {
                            $_ = defined($_) && /^#?[0-9A-Fa-f]{6}$/ ? rgb2sepia($_) : $_;
                        }
                    }
                }
                return $basec;
            };
        } else {
            #$sepiact->{colors}{$cn} = $cv;
        }
    }
    $color_themes{sepia} = $sepiact;
}

1;
# ABSTRACT: More color themes
