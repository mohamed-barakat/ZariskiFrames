#! @Chunk OpenSubsetOfSpecZ

LoadPackage( "ZariskiFrames" );

#! @Example
ZZ := HomalgRingOfIntegersInSingular( );
#! Z
ZF := ZariskiFrameOfAffineSpectrumUsingCategoryOfRows( ZZ );
#! The frame of Zariski open subsets of the affine spectrum of Z
A := OpenSubsetOfSpec( HomalgMatrix( [ 4 ], 1, 1, ZZ ) );
#! D_{Z}( <...> )
Display( A );
#! D( <4> )
B := OpenSubsetOfSpec( "[ 12,20 ]", ZZ );
#! D_{Z}( <...> )
C := OpenSubsetOfSpecByReducedMorphism( "[ 3 ]", ZZ );
#! D_{Z}( <...> )
D := OpenSubsetOfSpec( "[ 12 ]", ZZ );
#! D_{Z}( <...> )
A = B;
#! true
Display( A );
#! D( <2> )
A = C;
#! false
LCA := LocallyClosedPart( A );
#! V_{Z}( I ) \ V_{Z}( J )
Display( LCA );
#! V( <> ) \ V( <2> )
embAB := UniqueMorphism( A, B );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAB );
#! true
IsIsomorphism( embAB );
#! true
embAC := UniqueMorphism( A, C );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAC );
#! false
embDA := UniqueMorphism( D, A );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embDA );
#! true
IsSubset( A, D );
#! true
IsIsomorphism( embDA );
#! false
embAD := UniqueMorphism( A, D );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( embAD );
#! false
IsSubset( D, A );
#! false
T := TerminalObject( ZF );
#! D_{Z}( <...> )
Display( T );
#! D( <1> )
I := InitialObject( ZF );
#! D_{Z}( <...> )
Display( I );
#! ∅
A := OpenSubsetOfSpec( "[ 4 ]", ZZ );
#! D_{Z}( <...> )
Display( A );
#! D( <4> )
AvC := Coproduct( A, C );
#! D_{Z}( <...> )
Display( AvC );
#! D( <4,3> )
AvC = T;
#! true
Display( AvC );
#! D( <1> )
AC := DirectProduct( A, C );
#! D_{Z}( <...> )
Display( AC );
#! { D( <4> ) ∩ D( <3> ) }
StandardizeObject( AC );
#! D_{Z}( <...> )
Display( AC );
#! { D( <2> ) ∩ D( <3> ) }
ExponentialOnObjects( I, T ) = T;
#! true
ExponentialOnObjects( A, T ) = T;
#! true
ExponentialOnObjects( T, T ) = T;
#! true
ExponentialOnObjects( T, A ) = A;
#! true
ExponentialOnObjects( T, I ) = I;
#! true
ExponentialOnObjects( A, I ) = I;
#! true
ExponentialOnObjects( I, I ) = T;
#! true
ExponentialOnObjects( D, B ) = T;
#! true
ExponentialOnObjects( B, D ) = C;
#! true
ExponentialOnObjects( D, C ) = T;
#! true
ExponentialOnObjects( C, D ) = B;
#! true
IsWellDefined( CartesianEvaluationMorphism( A, C ) );
#! true
IsIsomorphism( CartesianEvaluationMorphism( A, C ) );
#! false
IsWellDefined( CartesianEvaluationMorphism( C, A ) );
#! true
IsIsomorphism( CartesianEvaluationMorphism( C, A ) );
#! false
IsWellDefined( CartesianCoevaluationMorphism( A, D ) );
#! true
IsIsomorphism( CartesianCoevaluationMorphism( A, D ) );
#! false
IsWellDefined( CartesianCoevaluationMorphism( D, A ) );
#! true
IsIsomorphism( CartesianCoevaluationMorphism( D, A ) );
#! false
th := UniqueMorphism( DirectProduct( A, C ), C );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( th );
#! true
th := DirectProductToExponentialAdjunctionMap( A, C, th );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( th );
#! true
IsIsomorphism( th );
#! false
ht := UniqueMorphism( A, ExponentialOnObjects( D, B ) );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( ht );
#! true
ht := ExponentialToDirectProductAdjunctionMap( D, B, ht );
#! <An epi-, monomorphism in The frame of Zariski open subsets of the\
#!  affine spectrum of Z>
IsWellDefined( ht );
#! true
IsIsomorphism( ht );
#! false
IsWellDefined( CartesianPreComposeMorphism( A, C, D ) );
#! true
IsIsomorphism( CartesianPreComposeMorphism( A, C, D ) );
#! false
p := AClosedSingleton( D );
#! V_{Z}( <...> )
Display( p );
#! V( <5> )
q := AClosedSingleton( D - p );
#! V_{Z}( <...> )
Display( q );
#! V( <7> )
p + q = D;
#! false
#! @EndExample
