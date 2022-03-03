(defrule continue
    =>
    (printout t crlf "Selamat datang di Appendicicheck! 
    Program ini memberikan informasi terkait radang usus buntu sekaligus untuk mendeteksi radang usus buntu. 
    Ketik 1 untuk iya dan 2 untuk tidak" crlf)
    (printout t crlf "Apakah anda ingin melanjutkan?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (continue yes))
        then (assert (check_info))
    )
    (if (= ?x 2)
        then (assert (continue no))
        then (assert (check_quit))
    )
)
(defrule info
    (check_info)
    =>
    (printout t crlf "Radang usus buntu atau dalam bahasa medisnya disebut apendisitis adalah peradangan pada apendiks vermiformis (umbai cacing/usus buntu).
    Usus buntu terletak di perut bagian kanan bawah dan besarnya kira-kira sejari kelingking. 
    Pada awalnya organ ini dianggap sebagai organ tambahan yang tidak memiliki fungsi, 
    namun penelitian telah menemukan jaringan getah bening yang merupakan bagian sistem kekebalan tubuh yang menghasilkan antibodi pada dinding usus buntu, 
    sehingga usus buntu sendiri memiliki fungsi sebagai organ imunologik dan secara aktif berperan dalam sekresi immunoglobulin 
    (suatu kekebalan tubuh) di mana memiliki kelenjar limfoid" crlf)
    (printout t crlf "Selanjutnya program ini akan menanyakan beberapa hal untuk mengidentifikasi radang pada usus buntu." crlf)
    (printout t crlf "Apakah anda ingin melanjutkan? (1 untuk ya dan 2 untuk tidak)" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (info yes))
        then (assert (check_cek))
    )
    (if (= ?x 2)
        then (assert (info no))
        then (assert (check_quit))
    )
)

(defrule quit
    (check_quit)
    =>
    (printout t crlf "Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule cek
    (check_cek)
    =>
    (printout t crlf "Apakah anda memiliki riwayat radang usus buntu sebelumnya?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (cek yes))
        then (assert (check_treatment))
    )
    (if (= ?x 2)
        then (assert (cek no))
        then (assert (check_ache))
    )
)

(defrule treatment
    (check_treatment)
    =>
    (printout t crlf "Apakah anda masih melanjutkan perawatan?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (treatment yes))
        then(assert (check_contTreatment))
    )
    (if (= ?x 2)
        then (assert (treatment no))
        then (assert (check_ache))
    )
)

(defrule contTreatment
    (check_contTreatment)
    =>
    (printout t crlf "Silahkan lanjutkan treatment yang telah diberikan dokter. Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule ache
    (check_ache)
    =>
    (printout t crlf "Apakah anda merasa nyeri pada perut?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (ache yes))
        then (assert (check_position))
    )
    (if (= ?x 2)
        then (assert (ache no))
        then (assert (check_symptoms))
    )
)

(defrule position
    (check_position)
    =>
    (printout t crlf "Apakah nyeri yang anda rasakan berada pada bagian kanan bawah perut?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (position yes))
        then (assert (check_frequent))
    )
    (if (= ?x 2)
        then (assert (position no))
        then (assert (check_frequent))
    )
)

(defrule frequent
    (check_frequent)
    =>
    (printout t crlf "Apakah rasa nyeri yang anda rasakan hilang timbul?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (frequent yes))
        then (assert (check_symptoms))
    )
    (if (= ?x 2)
        then (assert (frequent no))
        then (assert (check_symptoms))
    )
)

(defrule symptoms
    (check_symptoms)
    =>
    (printout t crlf "Apakah anda pernah/sedang merasakan lebih dari 3 di bawah selama 3 hari belakangan?
    1. Demam ringan
    2. Kehilangan selera makan
    3. Mual dan muntah
    4. Diare" crlf)
    (bind ?x (read))
    (if (= ?x 1)
        then (assert (symptoms yes))
        then (assert (check_lift))
    )
    (if (= ?x 2)
        then (assert (symptoms no))
        then (assert (check_lift))
    )
)

(defrule lift
    (check_lift)
    =>
    (printout t crlf "Terakhir, apabila memungkinkan, cobalah untuk rebahan dan angkat paha kanan secara perlahan mengarah badan anda. 
    Apakah anda merasakan nyeri yang berlebih (hingga tidak mampu menangkat paha sedekat mungkin dengan badan)?" crlf)
    (bind ?x (read))
    (if (= ?x 1)
         then (assert (lift yes))
    )
    (if (= ?x 2)
        then (assert (lift no))
    )
)

(defrule result_1
    (ache yes)
    (symptoms yes)
    (lift yes)
    =>
    (printout t crlf "Anda mengalami gejala umum radang usus buntu. Silahkan kunjungi dokter untuk pemeriksaan lebih lanjut. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_2
    (ache yes)
    (symptoms yes)
    (lift no)
    =>
    (printout t crlf "Anda mengalami gejala umum radang usus buntu. Silahkan kunjungi dokter untuk pemeriksaan lebih lanjut. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_3
    (ache yes)
    (symptoms no)
    (lift yes)
    =>
    (printout t crlf "Anda mengalami beberapa gejala yang mengindikasikan radang usus buntu, 
    namun gejala yang dialami bukanlah gejala umum dari radang usus buntu. 
    Silahkan kunjungi dokter untuk pemeriksaan lebih lanjut. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_4
    (ache no)
    (symptoms yes)
    (lift yes)
    =>
    (printout t crlf "Anda mengalami beberapa gejala yang mengindikasikan radang usus buntu, 
    namun gejala yang dialami bukanlah gejala umum dari radang usus buntu. 
    Silahkan kunjungi dokter untuk pemeriksaan lebih lanjut. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_5
    (ache yes)
    (symptoms no)
    (lift no)
    =>
    (printout t crlf "Anda tidak mengalami gejala umum radang usus buntu. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_6
    (ache no)
    (symptoms yes)
    (lift no)
    =>
    (printout t crlf "Anda mengalami beberapa gejala yang mengindikasikan radang usus buntu, 
    namun gejala yang dialami bukanlah gejala umum dari radang usus buntu. 
    Silahkan kunjungi dokter untuk pemeriksaan lebih lanjut. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_7
    (ache no)
    (symptoms no)
    (lift yes)
    =>
    (printout t crlf "Anda tidak mengalami gejala umum radang usus buntu. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)

(defrule result_8
    (ache no)
    (symptoms no)
    (lift no)
    =>
    (printout t crlf "Anda tidak mengalami gejala umum radang usus buntu. 
    Terima kasih telah menggunakan Appendicicheck! Sampai jumpa di lain kesempatan!" crlf)
)