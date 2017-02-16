(defn big [st, n]
  "Return true if length of st is bigger then n. Otherwise return false."
 (< n (count st)))
(big "string" 5)
(big "string" 6)

(defn collection-type-cond [col]
  "return :list, :map, :vector based on the type of collection [col]"
  (cond
    (list? col) :list
    (map? col) :map
    (vector? col) :vector
    :else "None of the above"))