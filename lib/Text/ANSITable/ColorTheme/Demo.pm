package Text::ANSITable::ColorTheme::Demo;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

use Data::Clone;
use Color::RGB::Util qw(rand_rgb_color mix_2_rgb_colors);
require Text::ANSITable;

our %color_themes = ();

my $defct = Text::ANSITable->get_color_theme("Default::default_nogradation");

{
    my $ct = clone $defct;

    $ct->{v} = 1.1;
    $ct->{summary} = 'Demoes coderef in item color';
    $ct->{description} = <<'_';

Accept arguments C<border1> and C<border2> to set range of random colors.
Otherwise full range (000000-ffffff) is used.

Also accepts C<border1_bg> and C<border2_bg> to set random background RGB
colors.

_
    $ct->{colors}{border} = sub {
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
        {fg=>$rgbf, bg=>$rgbb};
    };

    $color_themes{demo_random_border_color} = $ct;
}

{
    my $ct = {
        v => 1.1,
        summary => "Show random 8 color",
    };
    my $sub = sub {
        {ansi_fg => "\e[".(30+int(rand()*8))."m"};
    };
    for my $c (keys %{ $defct->{colors} }) {
        $ct->{colors}{$c} = $sub;
    }
    $color_themes{demo_random_8} = $ct;
}

{
    my $ct = {
        v => 1.1,
        summary => "Show random 16 color",
    };
    my $sub = sub {
        {ansi_fg=>"\e[".(30+int(rand()*8)).(rand() > 0.5 ? ";1":"")."m"};
    };
    for my $c (keys %{ $defct->{colors} }) {
        $ct->{colors}{$c} = $sub;
    }
    $color_themes{demo_random_16} = $ct;
}

{
    my $ct = {
        v => 1.1,
        summary => "Show random 256 color",
    };
    my $sub = sub {
        {ansi_fg=>"\e[38;5;".int(rand()*256)."m"};
    };
    for my $c (keys %{ $defct->{colors} }) {
        $ct->{colors}{$c} = $sub;
    }
    $color_themes{demo_random_256} = $ct;
}

{
    my $ct = {
        v => 1.1,
        summary => "Show random 24bit color",
    };
    my $sub = sub {
        rand_rgb_color();
    };
    for my $c (keys %{ $defct->{colors} }) {
        $ct->{colors}{$c} = $sub;
    }
    $color_themes{demo_random_24bit} = $ct;
}

{
    my $ct = {
        v => 1.1,
        summary => "Show random color according to detected color depth",
    };
    my $sub = sub {
        my $self = shift;
        my $cd = $self->detect_terminal->{color_depth};
        if ($cd >= 2**24) {
            return rand_rgb_color();
        } elsif ($cd >= 256) {
            return {ansi_fg=>"\e[38;5;".int(rand()*256)."m"};
        } elsif ($cd >= 16) {
            return {ansi_fg=>"\e[".(30+int(rand()*8)).
                        (rand() > 0.5 ? ";1":"")."m"};
        } else {
            return undef;
        }
    };
    for my $c (keys %{ $defct->{colors} }) {
        $ct->{colors}{$c} = $sub;
    }
    $color_themes{demo_random} = $ct;
}

1;
# ABSTRACT: Demo color themes
