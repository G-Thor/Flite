(RegularGrammar
 name
 nil
 ((s1 -> "_p.name_is_þ_" s2)
  (s1 -> "_not_p.name_is_þ_" s3)
  (s2 -> "_p.p.p.name_is_0_" s4)
  (s2 -> "_not_p.p.p.name_is_0_" s5)
  (s4 -> v)
  (s5 -> "_n.name_is_e_" s6)
  (s5 -> "_not_n.name_is_e_" s7)
  (s6 -> v)
  (s7 -> epsilon)
  (s3 -> v)))
