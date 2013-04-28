package Text::ANSITable::ColorTheme::Demo;

use 5.010;
use strict;
use warnings;

use SHARYANTO::Color::Util qw(rand_rgb_color mix_2_rgb_colors);

# VERSION

our %color_themes = (

    demo_random_border_color => {
        summary => 'Demoes coderef in item color',
        description => <<'_',

Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.

Also accepts C<border1_bg> and C<border2_bg> to set random background RGB
colors.

_
        colors => {
            border => sub {
                my ($self, %args) = @_;
                my $rgbf1 = $self->{color_theme_args}{border1};
                my $rgbf2 = $self->{color_theme_args}{border2};
                my $rgbf = rand_rgb_color($rgbf1, $rgbf2);
                my $rgbb1 = $self->{color_theme_args}{border1_bg};
                my $rgbb2 = $self->{color_theme_args}{border2_bg};
                my $rgbb;
                if ($rgbb1 && $rgbb2) {
                    $rgbb = rand_rgb_color($rgbb1, $rgbb2);
                }
                [$rgbf, $rgbb];
            },
        },
    },

    demo_gradation_border_color => {
        summary => 'Demoes coderef in item color',
        description => <<'_',

Accept arguments C<border1> and C<border2> to set first (top) and second
(bottom) foreground RGB colors. Colors will fade from the top color to bottom
color.

Also accepts C<border1_bg> and C<border2_bg> to set background RGB colors.

_
        colors => {
            border => sub {
                my ($self, %args) = @_;

                my $y;
                my $num_rows = @{$self->{_draw}{frows}};
                my $bcy = $args{bch}[0];
                if ($bcy == 0) {
                    $y = 0;
                } elsif ($bcy == 1) {
                    $y = 1;
                } elsif ($bcy == 2) {
                    $y = 2;
                } elsif ($bcy == 5) {
                    $y = $num_rows + 3;
                } else {
                    $y = $args{row_idx}+3;
                }

                my $rgbf1 = $self->{color_theme_args}{border1} // 'ffffff';
                my $rgbf2 = $self->{color_theme_args}{border2} // '444444';
                my $rgbf = mix_2_rgb_colors($rgbf1, $rgbf2, $y/($num_rows+3));

                my $rgbb1 = $self->{color_theme_args}{border1_bg};
                my $rgbb2 = $self->{color_theme_args}{border2_bg};
                my $rgbb;
                if ($rgbb1 && $rgbb2) {
                    $rgbb = mix_2_rgb_colors($rgbb1, $rgbb2, $y/($num_rows+3));
                }

                #say "D:$rgbf, $rgbb";
                [$rgbf, $rgbb];
            },
        },
    },

);

1;
# ABSTRACT: Demo color themes

