;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                                       ;;
;;;                Centre for Speech Technology Research                  ;;
;;;                     University of Edinburgh, UK                       ;;
;;;                         Copyright (c) 1998                            ;;
;;;                        All Rights Reserved.                           ;;
;;;                                                                       ;;
;;;  Permission is hereby granted, free of charge, to use and distribute  ;;
;;;  this software and its documentation without restriction, including   ;;
;;;  without limitation the rights to use, copy, modify, merge, publish,  ;;
;;;  distribute, sublicense, and/or sell copies of this work, and to      ;;
;;;  permit persons to whom this work is furnished to do so, subject to   ;;
;;;  the following conditions:                                            ;;
;;;   1. The code must retain the above copyright notice, this list of    ;;
;;;      conditions and the following disclaimer.                         ;;
;;;   2. Any modifications must be clearly marked as such.                ;;
;;;   3. Original authors' names are not deleted.                         ;;
;;;   4. The authors' names are not used to endorse or promote products   ;;
;;;      derived from this software without specific prior written        ;;
;;;      permission.                                                      ;;
;;;                                                                       ;;
;;;  THE UNIVERSITY OF EDINBURGH AND THE CONTRIBUTORS TO THIS WORK        ;;
;;;  DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      ;;
;;;  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   ;;
;;;  SHALL THE UNIVERSITY OF EDINBURGH NOR THE CONTRIBUTORS BE LIABLE     ;;
;;;  FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    ;;
;;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   ;;
;;;  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          ;;
;;;  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       ;;
;;;  THIS SOFTWARE.                                                       ;;
;;;                                                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;  Definition of Festival lexicon, derived from CMUDICT-0.4
;;;

(defvar lvl_is_lexdir (path-append lexdir "lvl_is"))

(require 'pos)
(require 'lvl_is_v0_phoneset)

(set! lvl_is_lex_version "2.0 (from 0.4) July 2008")

(define (cmu_lts_function word feats)
  "(cmu_lts_function word feats)
Function called for lvl_is_lex when word is not found in lexicon.  Uses
LTS rules trained from the original lexicon, and lexical stress
prediction rules."
  (require 'lts)
  (if (not (boundp 'lvl_is_lts_rules))
      (load (path-append lvl_is_lexdir "lvl_is_lts_rules.scm")))
      (set! lvl_is_lts_rules lex_lts_rules)
  (let ((dcword (downcase word))
	(syls) (phones))
    (if (string-matches dcword "[a-záéíóúýþæöð]*")
	(begin
	  (set! phones (lts_predict dcword lvl_is_lts_rules))
	  (set! syls (lvl_is_lex_mosyl_phstress phones))
	  )
	(set! syls nil))
    (list word nil syls)))

(define (lvl_is_lex_addenda)
  "(lvl_is_lex_addenda)
Add entries to the current lexicon (radio/darpa).  These are basically
words that are not in the CMU lexicon."
;   (lex.add.entry
;    '("Jan" n (((jh ae n y) 1) ((uw) 0) ((eh r) 1) ((iy) 0))))
;   (lex.add.entry
;    '("Feb" n (((f eh b) 1) ((r ax) 0) ((er) 0) ((iy) 0))))
;   (lex.add.entry
;    '("February" n (((f eh b) 1) ((r ax) 0) ((er) 0) ((iy) 0))))
;   (lex.add.entry
;    '("Mar" n (((m aa r ch) 0))))
;   (lex.add.entry
;    '("Apr" n (((ey p) 1) ((r ah l) 0))))
;   (lex.add.entry
;    '("Jun" n  (((jh uw n) 1))))
;   (lex.add.entry
;    '("Jul" n  (((jh uw l) 1) ((ay) 1))))
;   (lex.add.entry
;    '("Aug" n  (((aa g) 1) ((ah s t) 0))))
;   (lex.add.entry
;    '("Sep" n (((s eh p) 0) ((t eh m b) 1) ((er) 0))))
;   (lex.add.entry
;    '("Sept" n (((s eh p) 0) ((t eh m b) 1) ((er) 0))))
;   (lex.add.entry
;    '("Oct" n (((aa k) 0) ((t ow b) 1) ((er) 0))))
;   (lex.add.entry
;    '("Nov" n (((n ow v) 0) ((eh m b) 1) ((er) 0))))
;   (lex.add.entry
;    '("Dec" n (((d ih s) 0) ((eh m b) 1) ((er) 0))))
;   (lex.add.entry
;    '("'s" pos (((ax z) 0))))
;   (lex.add.entry 
;    '("*" n (((ae s) 1) ((t er) 0) ((ih s k) 0)) ((pos "K6%"))))
;   (lex.add.entry 
;    '("%" n (((p er) 1) ((s eh n t) 1)) ((pos "K9%"))))
;   (lex.add.entry 
;    '("&" n (((ae m p) 1) ((er s) 0) ((ae n d) 0))))
;   (lex.add.entry 
;    '("$" n (((d aa l) 1) ((er) 0))))
;   (lex.add.entry 
;    '("#" n (((hh ae sh) 1))))
;   (lex.add.entry 
;    '("@" n (((ae t) 1))))
;   (lex.add.entry 
;    '("+" n (((p l ah s) 0)) ((pos "K7%" "OA%" "T-%"))))
;   (lex.add.entry 
;    '("^" n (((k eh r) 1) ((eh t) 0)) ((pos "K6$"))))
;   (lex.add.entry 
;    '("~" n (((t ih l d) 1) ((ah) 0)) ((pos "K6$"))))
;   (lex.add.entry 
;    '("=" n (((iy k) 1) ((w ah l) 0))))
;   (lex.add.entry 
;    '("/" n (((s l ae sh) 1))))
;   (lex.add.entry 
;    '("\\" n (((b ae k) 1) ((s l ae sh) 1))))
;   (lex.add.entry 
;    '("_" n (((ah n d) 1) ((er s) 0) ((k ao r) 1))))
;   (lex.add.entry 
;    '("|" n (((v er t) 1) ((ih k) 0) ((ah l) 0) ((b aa r) 1))))
;   (lex.add.entry 
;    '(">" n ((( g r ey ) 1) ((t er) 0) ((dh ae n) 1))))
;   (lex.add.entry 
;    '("<" n ((( l eh s) 1) ((dh ae n) 1))))
;   (lex.add.entry 
;    '("[" n ((( l eh f t) 1) ((b r ae k) 1) ((ih t) 0))))
;   (lex.add.entry 
;    '("]" n ((( r ay t) 1) ((b r ae k) 1) ((ih t) 0))))
;   (lex.add.entry 
;    '(" " n (((s p ey s) 1))))
;   (lex.add.entry 
;    '("\t" n (((t ae b) 1))))
;   (lex.add.entry 
;    '("\n" n (((n uw) 1) ((l ay n) 1))))
;   (lex.add.entry '("." punc nil))
;   (lex.add.entry '("'" punc nil))
;   (lex.add.entry '(":" punc nil))
;   (lex.add.entry '(";" punc nil))
;   (lex.add.entry '("," punc nil))
;   (lex.add.entry '("-" punc nil))
;   (lex.add.entry '("\"" punc nil))
;   (lex.add.entry '("`" punc nil))
;   (lex.add.entry '("?" punc nil))
;   (lex.add.entry '("!" punc nil))
  )

(define  (lvl_is_lex_map_sylstructure syls)
  (unwind-protect
   (begin
     (mapcar
      (lambda (s1 s2)
        (list s1 (cadr s2)))
      (lvl_is_lex_syllabify_maxonset
       (apply
        append
        (mapcar car syls)))
      syls))
   (begin
     (format t "Failed to resyllabify %l\n" syls)
     syls))
)

(define (lvl_is_lex_mosyl_phstress phones)
  (set! xxx  (mapcar
   (lambda (syl)
     (set! stress 0)
     (list 
      (mapcar
       (lambda (p)
         (cond
          ((string-matches p "[aeiouáéíóúyýæö@].*1")
           (set! stress 1)
           (intern (substring p 0 (- (length p) 1))))
          ((string-matches p "[aeiouáéíóúyýæö@].*0")
           (set! stress 0)
           (intern (substring p 0 (- (length p) 1))))
          (t
           (intern p))))
       (mapcar string-append syl))
      stress))
   (lvl_is_lex_syllabify_maxonset phones)))
;  (format t "%l\n%l\n" phones xxx)
  xxx

)

(define (lvl_is_lex_syllabify_maxonset phones) 
  (lvl_is_lex_syllabify_maxonset2 
   (mapcar intern (reverse phones))
   nil nil)
)

(define (lvl_is_lex_syllabify_maxonset2 phones syl syls)
  "(lvl_is_lex_syllabify_maxonset phones)
Syllabify by maximum onset. phones is given in reverse order"
;  (format t "csm2 phones %l syl %l syls %l\n" 
;          phones syl syls)
  (cond
   ((null phones)
    (if syl
        (cons (reverse syl) syls)
        syls))
   ((null (lvl_is_lex_has_vowel phones))  ;; safety case
    ;; could some weird onset we've never seen before
    (cons
     (append (reverse phones) syl)
     syls))
   ((null (string-matches (car phones) "[aeiouáéíóúyýæö@].*"))  ;; a vowel
    (lvl_is_lex_syllabify_maxonset2
     (cdr phones)
     (cons (car phones) syl)
     syls))
   (t  ;; is a vowel
    (let ((onset (lvl_is_lex_maxonset (cdr phones))))
      (lvl_is_lex_syllabify_maxonset2
       (nth_cdr (+ 1 (length onset)) phones)
       nil
       (cons (append onset (list (car phones)) syl) syls))))))

(define (lvl_is_lex_has_vowel p)
  (cond
   ((null p) nil)
   ((string-matches (car p) "[aeiou@].*")  ;; a vowel
    t)
   (t
    (lvl_is_lex_has_vowel (cdr p)))))

(define (lvl_is_lex_maxonset phones)
  (cond
   ((string-matches (car phones) "[aeiouáéíóúyýöæ@].*")
    nil)
   ((string-equal (car phones) "ng") ;; only non-syl-initial phone
    nil)
   ((null phones) nil)
   ((and (> (length phones) 2)
         (member (list (car (cddr phones))
                       (cadr phones)
                       (car phones)
                       )
                 lvl_is_lex_tri_onsets))
    (list (car (cddr phones))
                       (cadr phones)
                       (car phones)
                       ))
   ((and (> (length phones) 1)
         (member (list (cadr phones)
                       (car phones))
                 lvl_is_lex_di_onsets))
    (list (cadr phones)
          (car phones)))
   (t
    (list (car phones)))))

(set! lvl_is_lex_tri_onsets
      '(
        (s t r)
        (s p y)
        (s p r)
        (s p l)
        (s k y)
        (s k w)
        (s k r)
        (s k l)
        ))

(set! lvl_is_lex_di_onsets
'(
        (z w)
        (z l)
        (v y)
        (v r)
        (v l)
        (th w)
        (th r)
        ; (t y)
        (t w)
;        (t s)
        (t r)
        (sh w)
        (sh r)
        (sh n)
        (sh m)
        (sh l)
        (s w)
        (s v)
        (s t)
        (s r)
        (s p)
        (s n)
        (s m)
        (s l)
        (s k)
        (s f)
        (p y)
        (p w)
        (p r)
        (p l)
        (n y)
        (m y)
        (m r)
        (l y)
        (k y)
        (k w)
        (k r)
        (k l)
        (hh y)
        (hh w)
        (hh r)
        (hh l)
        (g y)
        (g w)
        (g r)
        (g l)
        (f y)
        (f r)
        (f l)
        (d y)
        (d w)
        (d r)
        (b y)
        (b w)
        (b r)
        (b l)
))

(set! lex_syllabification (list lvl_is_lex_mosyl_phstress))

(lex.create "lvl_is")
(lex.set.compile.file (path-append lvl_is_lexdir "lvl_is_dict.out"))

(lex.set.phoneset 'lvl_is)
(lex.set.lts.method 'cmu_lts_function)
;(lex.set.pos.map english_pos_map_wp39_to_wp20)
(lvl_is_lex_addenda)

(provide 'lvl_is_lex)
