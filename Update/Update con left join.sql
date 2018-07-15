' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Update con left join
'
'  Date : 06/03/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

select cli.refered_by, car_cctm.asociacion_c
    from accounts_cstm as car_cctm
    left join accounts as car on car_cctm.id_c = car.id
    left join leads as cli on car.id = cli.account_id
    where cli.refered_by is not null and car_cctm.asociacion_c is null

UPDATE accounts_cstm as custom
    left join accounts as car on car.id  = custom.id_c
    left join leads as cli on cli.account_id = car.id
    SET custom.asociacion_c =  cli.refered_by
    where cli.refered_by is not null and custom.asociacion_c is null


