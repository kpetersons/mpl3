Mpl2.Account.reopen
  end_date_fmt: (->
    @fmtDate(@, 'end_date')
  ).property('end_date')

  end_date_fmt_long: (->
    @fmtDateLong(@, 'end_date')
  ).property('end_date')

Mpl2.Category.reopen
  end_date_fmt: (->
    @fmtDate(@, 'end_date')
  ).property('end_date')

  end_date_fmt_long: (->
    @fmtDateLong(@, 'end_date')
  ).property('end_date')

Mpl2.Transaction.reopen
  date_when_fmt: (->
    @fmtDate(@, 'date_when')
  ).property('date_when')

  date_when_fmt_long: (->
    @fmtDateLong(@, 'date_when')
  ).property('date_when')

Mpl2.Aim.reopen
  from_date_fmt: (->
    @fmtDate(@, 'from_date')
  ).property('from_date')

  target_date_fmt: (->
    @fmtDate(@, 'target_date')
  ).property('target_date')

  complete_date_fmt: (->
    @fmtDate(@, 'complete_date')
  ).property('complete_date')

  from_date_fmt_long: (->
    @fmtDateLong(@, 'from_date')
  ).property('from_date')

  target_date_fmt_long: (->
    @fmtDateLong(@, 'target_date')
  ).property('target_date')

  complete_date_fmt_long: (->
    @fmtDateLong(@, 'complete_date')
  ).property('complete_date')

Mpl2.Plan.reopen
  start_date_fmt: (->
    @fmtDate(@, 'start_date')
  ).property('start_date')

  end_date_fmt: (->
    @fmtDate(@, 'end_date')
  ).property('end_date')

  start_date_fmt_long: (->
    @fmtDateLong(@, 'start_date')
  ).property('start_date')

  end_date_fmt_long: (->
    @fmtDateLong(@, 'end_date')
  ).property('end_date')

