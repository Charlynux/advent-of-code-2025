(require '[clojure.string :as str])

(def input (slurp "./src/day01/input"))

(def input "L68
L30
R48
L5
R60
L55
L1
L99
R14
L82")

(defn left [m] (fn [n] (mod (- n m) 100)))
(defn right [m] (fn [n] (mod (+ n m) 100)))

(->> (str/split-lines input)
     (map (fn [row] (let [[_ letter number]
                          (re-find #"([L|R])([0-9]+)" row)]
                      (
                       (if (= "L" letter) left right)
                       (Integer/parseInt number))
                      )))
     (reductions (fn [v f] (f v)) 50)
     (filter zero?)
     count)

(defn movement [f]
  (fn [m] (fn [n]
            (->> (iterate
                  (fn [x] (mod (f x) 100))
                  n)
                 (drop 1)
                 (take m)
                 reverse))))

(def left (movement dec))
(def right (movement inc))

(->> (str/split-lines input)
     (map (fn [row] (let [[_ letter number]
                          (re-find #"([L|R])([0-9]+)" row)]
                      (
                       (if (= "L" letter) left right)
                       (Integer/parseInt number))
                      )))
     (reduce
      (fn [vs f]
        (concat (f (first vs)) vs)
        ) '(50))
     (filter zero?)
     count
     )
