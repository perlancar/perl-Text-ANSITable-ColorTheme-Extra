package Text::ANSITable::ColorTheme::Monotone;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Convert::Color;
use Color::Theme::Util qw(create_color_theme_transform);
require Text::ANSITable;

sub _make_monotone_theme {
    my ($basect, $hue) = @_;
    my $ct = create_color_theme_transform(
        $basect, sub {
            $_[0] =~ /#?(..)(..)(..)/;
            my $r = hex($1);
            my $g = hex($2);
            my $b = hex($3);
            my $c = Convert::Color->new("rgb8:$r,$g,$b");
            my ($h, $s, $v) = $c->as_hsv->hsv;
            $c = Convert::Color->new("hsv:$hue,$s,$v");
            $c->as_rgb8->hex;
        });
    $ct->{v} = 1.1;
    $ct;
}

my $defct = Text::ANSITable->get_color_theme("Default::default_gradation");

our %color_themes = ();

{
    my $ct = _make_monotone_theme($defct, 0);
    $ct->{v} = 1.1;
    $ct->{summary} = 'Monotone red';
    $color_themes{monotone_red} = $ct;
}

{
    my $ct = _make_monotone_theme($defct, 60);
    $ct->{v} = 1.1;
    $ct->{summary} = 'Monotone yellow';
    $color_themes{monotone_yellow} = $ct;
}

{
    my $ct = _make_monotone_theme($defct, 120);
    $ct->{v} = 1.1;
    $ct->{summary} = 'Monotone green';
    $color_themes{monotone_green} = $ct;
}

{
    my $ct = _make_monotone_theme($defct, 180);
    $ct->{v} = 1.1;
    $ct->{summary} = 'Monotone cyan';
    $color_themes{monotone_cyan} = $ct;
}

{
    my $ct = _make_monotone_theme($defct, 240);
    $ct->{v} = 1.1;
    $ct->{summary} = 'Monotone blue';
    $color_themes{monotone_blue} = $ct;
}

{
    my $ct = _make_monotone_theme($defct, 300);
    $ct->{v} = 1.1;
    $ct->{summary} = 'Monotone purple';
    $color_themes{monotone_purple} = $ct;
}

1;
# ABSTRACT: Monotone color themes

=head1 DESCRIPTION

Monotone themes uses single-hue colors, differing only in saturation and
lightness/value.

=cut
