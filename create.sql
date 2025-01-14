CREATE TABLE IF NOT EXISTS irs527_filings (
    record_type text,
    form_type text,
    form_id_number text,
    period_begin_date date,
    period_end_date date,
    initial_report_indicator text,
    amended_report_indicator text,
    final_report_indicator text,
    change_of_address_indicator text,
    org_name text,
    ein text,
    mailing_address_1 text,
    mailing_address_2 text,
    mailing_address_city text,
    mailing_address_state text,
    mailing_address_zip_code text,
    mailing_address_zip_ext text,
    e_mail_address text,
    org_formation_date date,
    custodian_name text,
    custodian_address_1 text,
    custodian_address_2 text,
    custodian_address_city text,
    custodian_address_state text,
    custodian_address_zip_code text,
    custodian_address_zip_ext text,
    contact_person_name text,
    contact_address_1 text,
    contact_address_2 text,
    contact_address_city text,
    contact_address_state text,
    contact_address_zip_code text,
    contact_address_zip_ext text,
    business_address_1 text,
    business_address_2 text,
    business_address_city text,
    business_address_state text,
    business_address_zip_code text,
    business_address_zip_ext text,
    qtr_indicator text,
    monthly_rpt_month text,
    pre_elect_type text,
    pre_or_post_elect_date date,
    pre_or_post_elect_state text,
    sched_a_ind text,
    total_sched_a decimal(5,2),
    sched_b_ind text,
    total_sched_b decimal(5,2),
    insert_datetime text
);

TRUNCATE irs527_filings;

CREATE TABLE IF NOT EXISTS irs527_contributions (
    record_type text,
    form_id_number text,
    sched_id text,
    org_name text,
    ein text,
    contributor_name text,
    contributor_address_1 text,
    contributor_address_2 text,
    contributor_address_city text,
    contributor_address_state text,
    contributor_address_zip_code text,
    contributor_address_zip_ext text,
    contributor_employer text,
    contribution_amount integer,
    contributor_occupation text,
    agg_contribution_ytd text,
    contribution_date date
);

TRUNCATE irs527_contributions;

CREATE TABLE IF NOT EXISTS irs527_expenditures (
    record_type text,
    form_id_number text,
    sched_id text,
    org_name text,
    ein text,
    recipient_name text,
    recipient_address_1 text,
    recipient_address_2 text,
    recipient_address_city text,
    recipient_address_st text,
    recipient_address_zip_code text,
    recipient_address_zip_ext text,
    recipient_employer text,
    expenditure_amount integer,
    recipient_occupation text,
    expenditure_date date,
    expenditure_purpose text
);

TRUNCATE irs527_expenditures;
