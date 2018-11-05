#ifndef CANDYMACROS_H
#define CANDYMACROS_H


#define CANDY_PROPERTY(type,lower,upper) \
  protected:\
  type m_##lower;\
  public: \
  inline type lower() const { return m_##lower;} \
  inline void set##upper(type x) { m_##lower = x;}

#define CANDY_PROPERTY_VALUE(type,lower,upper,value) \
  protected:\
  type m_##lower = value;\
  public: \
  inline type lower() const { return m_##lower;} \
  inline void set##upper(type x) { m_##lower = x;}



#define CANDY_PROPERTY_RO(type, name) \
  protected:\
  type m_##name;\
  public:\
  inline type name() {return m_##name;}

#define CANDY_PROPERTY_RO_VALUE(type,lower,value) \
  protected:\
  type m_##lower = value;\
  public: \
  inline type lower() const { return m_##lower;}



#define CANDY_PROPERTY_DEF(type,lower,upper) \
  protected:\
  type m_##lower;\
  public: \
  type lower() const;\
  void set##upper(type x);

#define CANDY_PROPERTY_DEF_VALUE(type,lower,upper,value) \
  protected:\
  type m_##lower = value;\
  public: \
  type lower() const;\
  void set##upper(type x);

#define CANDY_PROPERTY_QOBJ_PTR(type,lower,upper) \
  protected:\
  type* m_##lower;\
  public: \
  inline type* lower() const { return m_##lower;} \
  inline void set##upper(type* x) {x->setParent(this); m_##lower = x;}


//#define CANDY_DEBUG qDebug() << QString("[%1]").arg(this->metaObject()->className())
//#define CANDY_DEBUG qDebug("[%s]", this->metaObject()->className())
#define CANDY_DEBUG qDebug() << this->metaObject()->className() << "|" << this->objectName() << ":::"

#endif // CANDYMACROS_H
