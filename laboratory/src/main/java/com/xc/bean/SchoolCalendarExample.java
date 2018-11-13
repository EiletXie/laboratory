package com.xc.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SchoolCalendarExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SchoolCalendarExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andLenIdIsNull() {
            addCriterion("len_id is null");
            return (Criteria) this;
        }

        public Criteria andLenIdIsNotNull() {
            addCriterion("len_id is not null");
            return (Criteria) this;
        }

        public Criteria andLenIdEqualTo(Integer value) {
            addCriterion("len_id =", value, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdNotEqualTo(Integer value) {
            addCriterion("len_id <>", value, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdGreaterThan(Integer value) {
            addCriterion("len_id >", value, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("len_id >=", value, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdLessThan(Integer value) {
            addCriterion("len_id <", value, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdLessThanOrEqualTo(Integer value) {
            addCriterion("len_id <=", value, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdIn(List<Integer> values) {
            addCriterion("len_id in", values, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdNotIn(List<Integer> values) {
            addCriterion("len_id not in", values, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdBetween(Integer value1, Integer value2) {
            addCriterion("len_id between", value1, value2, "lenId");
            return (Criteria) this;
        }

        public Criteria andLenIdNotBetween(Integer value1, Integer value2) {
            addCriterion("len_id not between", value1, value2, "lenId");
            return (Criteria) this;
        }

        public Criteria andStartdayIsNull() {
            addCriterion("startDay is null");
            return (Criteria) this;
        }

        public Criteria andStartdayIsNotNull() {
            addCriterion("startDay is not null");
            return (Criteria) this;
        }

        public Criteria andStartdayEqualTo(Date value) {
            addCriterionForJDBCDate("startDay =", value, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("startDay <>", value, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayGreaterThan(Date value) {
            addCriterionForJDBCDate("startDay >", value, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("startDay >=", value, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayLessThan(Date value) {
            addCriterionForJDBCDate("startDay <", value, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("startDay <=", value, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayIn(List<Date> values) {
            addCriterionForJDBCDate("startDay in", values, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("startDay not in", values, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("startDay between", value1, value2, "startday");
            return (Criteria) this;
        }

        public Criteria andStartdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("startDay not between", value1, value2, "startday");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}