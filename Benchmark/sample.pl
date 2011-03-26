use strict;
use warnings;

use Benchmark qw( cmpthese );

my ( $num, $assign ) = ();

sub pre_increment {
    $num = shift;
    ++$num;
}

sub post_increment {
    $num = shift;
    $num++;
}

sub pre_inc_assign {
    $num = shift;
    $assign = ++$num;
}

sub post_inc_assign {
    $num = shift;
    $assign = $num++;
}

cmpthese( 10_000_000, {
        pre         =>  sub { pre_increment( 1 ) },
        post        =>  sub { post_increment( 1 ) },
        pre_assign  =>  sub { pre_inc_assign( 1 ) },
        post_assign =>  sub { post_inc_assign( 1 ) },
});
