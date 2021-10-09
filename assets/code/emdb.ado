cap program drop emdb
program define emdb, eclass  
  version 11.0
  tempname newb
  matrix `newb' = e(b)
  matrix `newb' = draw
  ereturn repost b = `newb'
  end

