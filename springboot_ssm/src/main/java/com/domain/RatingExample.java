package com.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RatingExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RatingExample() {
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

        public Criteria andRidIsNull() {
            addCriterion("rId is null");
            return (Criteria) this;
        }

        public Criteria andRidIsNotNull() {
            addCriterion("rId is not null");
            return (Criteria) this;
        }

        public Criteria andRidEqualTo(Integer value) {
            addCriterion("rId =", value, "rid");
            return (Criteria) this;
        }

        public Criteria andRidNotEqualTo(Integer value) {
            addCriterion("rId <>", value, "rid");
            return (Criteria) this;
        }

        public Criteria andRidGreaterThan(Integer value) {
            addCriterion("rId >", value, "rid");
            return (Criteria) this;
        }

        public Criteria andRidGreaterThanOrEqualTo(Integer value) {
            addCriterion("rId >=", value, "rid");
            return (Criteria) this;
        }

        public Criteria andRidLessThan(Integer value) {
            addCriterion("rId <", value, "rid");
            return (Criteria) this;
        }

        public Criteria andRidLessThanOrEqualTo(Integer value) {
            addCriterion("rId <=", value, "rid");
            return (Criteria) this;
        }

        public Criteria andRidIn(List<Integer> values) {
            addCriterion("rId in", values, "rid");
            return (Criteria) this;
        }

        public Criteria andRidNotIn(List<Integer> values) {
            addCriterion("rId not in", values, "rid");
            return (Criteria) this;
        }

        public Criteria andRidBetween(Integer value1, Integer value2) {
            addCriterion("rId between", value1, value2, "rid");
            return (Criteria) this;
        }

        public Criteria andRidNotBetween(Integer value1, Integer value2) {
            addCriterion("rId not between", value1, value2, "rid");
            return (Criteria) this;
        }

        public Criteria andDnameIsNull() {
            addCriterion("dName is null");
            return (Criteria) this;
        }

        public Criteria andDnameIsNotNull() {
            addCriterion("dName is not null");
            return (Criteria) this;
        }

        public Criteria andDnameEqualTo(String value) {
            addCriterion("dName =", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameNotEqualTo(String value) {
            addCriterion("dName <>", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameGreaterThan(String value) {
            addCriterion("dName >", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameGreaterThanOrEqualTo(String value) {
            addCriterion("dName >=", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameLessThan(String value) {
            addCriterion("dName <", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameLessThanOrEqualTo(String value) {
            addCriterion("dName <=", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameLike(String value) {
            addCriterion("dName like", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameNotLike(String value) {
            addCriterion("dName not like", value, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameIn(List<String> values) {
            addCriterion("dName in", values, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameNotIn(List<String> values) {
            addCriterion("dName not in", values, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameBetween(String value1, String value2) {
            addCriterion("dName between", value1, value2, "dname");
            return (Criteria) this;
        }

        public Criteria andDnameNotBetween(String value1, String value2) {
            addCriterion("dName not between", value1, value2, "dname");
            return (Criteria) this;
        }

        public Criteria andUidIsNull() {
            addCriterion("uId is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uId is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("uId =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("uId <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("uId >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("uId >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("uId <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("uId <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("uId in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("uId not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("uId between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("uId not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andRtimeIsNull() {
            addCriterion("rTime is null");
            return (Criteria) this;
        }

        public Criteria andRtimeIsNotNull() {
            addCriterion("rTime is not null");
            return (Criteria) this;
        }

        public Criteria andRtimeEqualTo(Date value) {
            addCriterion("rTime =", value, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeNotEqualTo(Date value) {
            addCriterion("rTime <>", value, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeGreaterThan(Date value) {
            addCriterion("rTime >", value, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("rTime >=", value, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeLessThan(Date value) {
            addCriterion("rTime <", value, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeLessThanOrEqualTo(Date value) {
            addCriterion("rTime <=", value, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeIn(List<Date> values) {
            addCriterion("rTime in", values, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeNotIn(List<Date> values) {
            addCriterion("rTime not in", values, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeBetween(Date value1, Date value2) {
            addCriterion("rTime between", value1, value2, "rtime");
            return (Criteria) this;
        }

        public Criteria andRtimeNotBetween(Date value1, Date value2) {
            addCriterion("rTime not between", value1, value2, "rtime");
            return (Criteria) this;
        }

        public Criteria andRdetailIsNull() {
            addCriterion("rDetail is null");
            return (Criteria) this;
        }

        public Criteria andRdetailIsNotNull() {
            addCriterion("rDetail is not null");
            return (Criteria) this;
        }

        public Criteria andRdetailEqualTo(String value) {
            addCriterion("rDetail =", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailNotEqualTo(String value) {
            addCriterion("rDetail <>", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailGreaterThan(String value) {
            addCriterion("rDetail >", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailGreaterThanOrEqualTo(String value) {
            addCriterion("rDetail >=", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailLessThan(String value) {
            addCriterion("rDetail <", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailLessThanOrEqualTo(String value) {
            addCriterion("rDetail <=", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailLike(String value) {
            addCriterion("rDetail like", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailNotLike(String value) {
            addCriterion("rDetail not like", value, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailIn(List<String> values) {
            addCriterion("rDetail in", values, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailNotIn(List<String> values) {
            addCriterion("rDetail not in", values, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailBetween(String value1, String value2) {
            addCriterion("rDetail between", value1, value2, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRdetailNotBetween(String value1, String value2) {
            addCriterion("rDetail not between", value1, value2, "rdetail");
            return (Criteria) this;
        }

        public Criteria andRskillIsNull() {
            addCriterion("rSkill is null");
            return (Criteria) this;
        }

        public Criteria andRskillIsNotNull() {
            addCriterion("rSkill is not null");
            return (Criteria) this;
        }

        public Criteria andRskillEqualTo(Float value) {
            addCriterion("rSkill =", value, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillNotEqualTo(Float value) {
            addCriterion("rSkill <>", value, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillGreaterThan(Float value) {
            addCriterion("rSkill >", value, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillGreaterThanOrEqualTo(Float value) {
            addCriterion("rSkill >=", value, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillLessThan(Float value) {
            addCriterion("rSkill <", value, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillLessThanOrEqualTo(Float value) {
            addCriterion("rSkill <=", value, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillIn(List<Float> values) {
            addCriterion("rSkill in", values, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillNotIn(List<Float> values) {
            addCriterion("rSkill not in", values, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillBetween(Float value1, Float value2) {
            addCriterion("rSkill between", value1, value2, "rskill");
            return (Criteria) this;
        }

        public Criteria andRskillNotBetween(Float value1, Float value2) {
            addCriterion("rSkill not between", value1, value2, "rskill");
            return (Criteria) this;
        }

        public Criteria andRserviceIsNull() {
            addCriterion("rService is null");
            return (Criteria) this;
        }

        public Criteria andRserviceIsNotNull() {
            addCriterion("rService is not null");
            return (Criteria) this;
        }

        public Criteria andRserviceEqualTo(Float value) {
            addCriterion("rService =", value, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceNotEqualTo(Float value) {
            addCriterion("rService <>", value, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceGreaterThan(Float value) {
            addCriterion("rService >", value, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceGreaterThanOrEqualTo(Float value) {
            addCriterion("rService >=", value, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceLessThan(Float value) {
            addCriterion("rService <", value, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceLessThanOrEqualTo(Float value) {
            addCriterion("rService <=", value, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceIn(List<Float> values) {
            addCriterion("rService in", values, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceNotIn(List<Float> values) {
            addCriterion("rService not in", values, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceBetween(Float value1, Float value2) {
            addCriterion("rService between", value1, value2, "rservice");
            return (Criteria) this;
        }

        public Criteria andRserviceNotBetween(Float value1, Float value2) {
            addCriterion("rService not between", value1, value2, "rservice");
            return (Criteria) this;
        }

        public Criteria andReffectIsNull() {
            addCriterion("rEffect is null");
            return (Criteria) this;
        }

        public Criteria andReffectIsNotNull() {
            addCriterion("rEffect is not null");
            return (Criteria) this;
        }

        public Criteria andReffectEqualTo(Float value) {
            addCriterion("rEffect =", value, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectNotEqualTo(Float value) {
            addCriterion("rEffect <>", value, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectGreaterThan(Float value) {
            addCriterion("rEffect >", value, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectGreaterThanOrEqualTo(Float value) {
            addCriterion("rEffect >=", value, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectLessThan(Float value) {
            addCriterion("rEffect <", value, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectLessThanOrEqualTo(Float value) {
            addCriterion("rEffect <=", value, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectIn(List<Float> values) {
            addCriterion("rEffect in", values, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectNotIn(List<Float> values) {
            addCriterion("rEffect not in", values, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectBetween(Float value1, Float value2) {
            addCriterion("rEffect between", value1, value2, "reffect");
            return (Criteria) this;
        }

        public Criteria andReffectNotBetween(Float value1, Float value2) {
            addCriterion("rEffect not between", value1, value2, "reffect");
            return (Criteria) this;
        }

        public Criteria andRmoreIsNull() {
            addCriterion("rMore is null");
            return (Criteria) this;
        }

        public Criteria andRmoreIsNotNull() {
            addCriterion("rMore is not null");
            return (Criteria) this;
        }

        public Criteria andRmoreEqualTo(String value) {
            addCriterion("rMore =", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreNotEqualTo(String value) {
            addCriterion("rMore <>", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreGreaterThan(String value) {
            addCriterion("rMore >", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreGreaterThanOrEqualTo(String value) {
            addCriterion("rMore >=", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreLessThan(String value) {
            addCriterion("rMore <", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreLessThanOrEqualTo(String value) {
            addCriterion("rMore <=", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreLike(String value) {
            addCriterion("rMore like", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreNotLike(String value) {
            addCriterion("rMore not like", value, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreIn(List<String> values) {
            addCriterion("rMore in", values, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreNotIn(List<String> values) {
            addCriterion("rMore not in", values, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreBetween(String value1, String value2) {
            addCriterion("rMore between", value1, value2, "rmore");
            return (Criteria) this;
        }

        public Criteria andRmoreNotBetween(String value1, String value2) {
            addCriterion("rMore not between", value1, value2, "rmore");
            return (Criteria) this;
        }

        public Criteria andOidIsNull() {
            addCriterion("oId is null");
            return (Criteria) this;
        }

        public Criteria andOidIsNotNull() {
            addCriterion("oId is not null");
            return (Criteria) this;
        }

        public Criteria andOidEqualTo(Integer value) {
            addCriterion("oId =", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotEqualTo(Integer value) {
            addCriterion("oId <>", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThan(Integer value) {
            addCriterion("oId >", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThanOrEqualTo(Integer value) {
            addCriterion("oId >=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThan(Integer value) {
            addCriterion("oId <", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThanOrEqualTo(Integer value) {
            addCriterion("oId <=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidIn(List<Integer> values) {
            addCriterion("oId in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotIn(List<Integer> values) {
            addCriterion("oId not in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidBetween(Integer value1, Integer value2) {
            addCriterion("oId between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotBetween(Integer value1, Integer value2) {
            addCriterion("oId not between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andRmoretimeIsNull() {
            addCriterion("rMoretime is null");
            return (Criteria) this;
        }

        public Criteria andRmoretimeIsNotNull() {
            addCriterion("rMoretime is not null");
            return (Criteria) this;
        }

        public Criteria andRmoretimeEqualTo(Date value) {
            addCriterion("rMoretime =", value, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeNotEqualTo(Date value) {
            addCriterion("rMoretime <>", value, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeGreaterThan(Date value) {
            addCriterion("rMoretime >", value, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeGreaterThanOrEqualTo(Date value) {
            addCriterion("rMoretime >=", value, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeLessThan(Date value) {
            addCriterion("rMoretime <", value, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeLessThanOrEqualTo(Date value) {
            addCriterion("rMoretime <=", value, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeIn(List<Date> values) {
            addCriterion("rMoretime in", values, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeNotIn(List<Date> values) {
            addCriterion("rMoretime not in", values, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeBetween(Date value1, Date value2) {
            addCriterion("rMoretime between", value1, value2, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andRmoretimeNotBetween(Date value1, Date value2) {
            addCriterion("rMoretime not between", value1, value2, "rmoretime");
            return (Criteria) this;
        }

        public Criteria andUnameIsNull() {
            addCriterion("uName is null");
            return (Criteria) this;
        }

        public Criteria andUnameIsNotNull() {
            addCriterion("uName is not null");
            return (Criteria) this;
        }

        public Criteria andUnameEqualTo(String value) {
            addCriterion("uName =", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotEqualTo(String value) {
            addCriterion("uName <>", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameGreaterThan(String value) {
            addCriterion("uName >", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameGreaterThanOrEqualTo(String value) {
            addCriterion("uName >=", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLessThan(String value) {
            addCriterion("uName <", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLessThanOrEqualTo(String value) {
            addCriterion("uName <=", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameLike(String value) {
            addCriterion("uName like", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotLike(String value) {
            addCriterion("uName not like", value, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameIn(List<String> values) {
            addCriterion("uName in", values, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotIn(List<String> values) {
            addCriterion("uName not in", values, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameBetween(String value1, String value2) {
            addCriterion("uName between", value1, value2, "uname");
            return (Criteria) this;
        }

        public Criteria andUnameNotBetween(String value1, String value2) {
            addCriterion("uName not between", value1, value2, "uname");
            return (Criteria) this;
        }

        public Criteria andWeightIsNull() {
            addCriterion("weight is null");
            return (Criteria) this;
        }

        public Criteria andWeightIsNotNull() {
            addCriterion("weight is not null");
            return (Criteria) this;
        }

        public Criteria andWeightEqualTo(Integer value) {
            addCriterion("weight =", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightNotEqualTo(Integer value) {
            addCriterion("weight <>", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightGreaterThan(Integer value) {
            addCriterion("weight >", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("weight >=", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightLessThan(Integer value) {
            addCriterion("weight <", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightLessThanOrEqualTo(Integer value) {
            addCriterion("weight <=", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightIn(List<Integer> values) {
            addCriterion("weight in", values, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightNotIn(List<Integer> values) {
            addCriterion("weight not in", values, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightBetween(Integer value1, Integer value2) {
            addCriterion("weight between", value1, value2, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightNotBetween(Integer value1, Integer value2) {
            addCriterion("weight not between", value1, value2, "weight");
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