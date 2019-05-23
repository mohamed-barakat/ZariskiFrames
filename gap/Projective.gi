#
# ZariskiFrames: Zariski frames and coframes of projective varieties
#
# Implementations
#

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local S, B;
    
    S := UnderlyingRing( A );
    
    A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    A := List( A, UnderlyingMatrix );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    B := List( [ 1 .. NrRows( B ) ], r -> CertainRows( B, [ r ] ) );
    
    A := List( A, mat -> List( B, r -> Saturate( mat, r ) ) );
    
    A := Concatenation( A );
    
    return List( A, AsCategoryOfRowsMorphism );
    
end );

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasListOfReducedMorphismsOfUnderlyingCategory ],

  ListOfReducedMorphismsOfUnderlyingCategory );

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasReducedMorphismOfUnderlyingCategory ],

  ListOfReducedMorphismsOfUnderlyingCategory );

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasStandardMorphismOfUnderlyingCategory ],

  function( A )
    
    return [ StandardMorphismOfUnderlyingCategory( A ) ];
    
end );

##
InstallMethod( ListOfReducedMorphismsOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local S, B;
    
    S := UnderlyingRing( A );
    
    A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    A := List( A, UnderlyingMatrix );
    
    A := List( A, UnderlyingMatrixOverNonGradedRing );
    
    A := List( A, RadicalSubobjectOp );
    
    A := List( A, mat -> S * mat );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    A := List( A, mat -> List( [ 1 .. NrRows( B ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( B, [ r ] ), mat ) ) );
    
    A := List( A, L -> List( L, AsCategoryOfRowsMorphism ) );
    
    return List( A, ITERATED_INTERSECTION_OF_IDEALS_USING_CategoryOfRows );
    
end );
