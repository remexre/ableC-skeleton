grammar edu:umn:cs:melt:exts:ableC:skeleton:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;


abstract production skeleton
s::Stmt ::= loc::Location
{
  forwards to
    exprStmt(
      directCallExpr(
        name("puts", location=loc),
        consExpr(
          directCallExpr(
            name("getSkeletonString", location=loc),
            nilExpr(),
            location=loc),
          nilExpr()),
        location=loc));
}
