add_end_diff_lists(Elem, DiffList, EndDiffList, NewDiffList, EndNewDiffList) :-
    DiffList = NewDiffList,
    EndDiffList = [Elem|EndNewDiffList].
