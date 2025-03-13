package packclasses;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.lang.reflect.*;

/**
 *
 * @author MauricioAsenjo
 */
public class ALDAL {

    public static void geraTabela(Object obj) {
        Field[] f = obj.getClass().getDeclaredFields();
        String sql = "Create Table Tab" + obj.getClass().getSimpleName() + " (";

        for (int i = 0; i < f.length; ++i) {
            sql += f[i].getName() + " " + (f[i].getType().getSimpleName().equals("String") ? "varchar(60)" : f[i].getType());
            if (i != (f.length - 1)) {
                sql = sql + ", ";
            }
        }
        sql += ")";
        System.out.println(sql);
        AFDAL.conecta("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
        AFDAL.executeSQL(sql);
        AFDAL.desconecta();
    }

    public static void set(Object obj) {
        Field[] f = obj.getClass().getDeclaredFields();
        String sql = "Insert Into Tab" + obj.getClass().getSimpleName() + " (";
        Method mtd;

        for (int i = 0; i < f.length; ++i) {
            sql += f[i].getName();
            if (i != (f.length - 1)) {
                sql = sql + ", ";
            }
        }
        sql += ") values (";
        for (int i = 0; i < f.length; ++i) {
            try {
                String aux = "get" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                mtd = obj.getClass().getMethod(aux);

                if (f[i].getType().getSimpleName().equals("String")) {
                    sql += "'" + mtd.invoke(obj) + "'";
                } else {
                    sql += mtd.invoke(obj);
                }
            } catch (Exception e) {
            }
            if (i != (f.length - 1)) {
                sql = sql + ", ";
            }
        }
        sql += ")";
        System.out.println(sql);
        AFDAL.conecta("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
        AFDAL.executeSQL(sql);
        AFDAL.desconecta();
    }

    public static void delete(Object obj) {
        Field[] f = obj.getClass().getDeclaredFields();
        String sql = "Delete from Tab" + obj.getClass().getSimpleName() + " where ";
        Method mtd;
        String aux1, aux2;
        boolean flag = false;

        for (int i = 0; i < f.length; ++i) {
            try {
                aux1 = "get" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                mtd = obj.getClass().getMethod(aux1);
                aux2 = mtd.invoke(obj).toString();
                if (!aux2.equals("")) {
                    if (flag) {
                        sql += " and ";
                    } else {
                        flag = true;
                    }
                    sql += f[i].getName() + " = ";
                    if (f[i].getType().getSimpleName().equals("String")) {
                        sql += "'" + aux2 + "'";
                    } else {
                        sql += aux2;
                    }
                }
            } catch (Exception e) {
            }
        }

        System.out.println(sql);
        AFDAL.conecta("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
        AFDAL.executeSQL(sql);
        AFDAL.desconecta();
    }

    public static void get(Object obj) {
        Field[] f = obj.getClass().getDeclaredFields();
        String sql = "Select * from Tab" + obj.getClass().getSimpleName() + " where ";
        Method mtd;
        String aux1, aux2;
        boolean flag = false;

        for (int i = 0; i < f.length; ++i) {
            try {
                aux1 = "get" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                mtd = obj.getClass().getMethod(aux1);
                aux2 = mtd.invoke(obj).toString();
                if (!aux2.equals("")) {
                    if (flag) {
                        sql += " and ";
                    } else {
                        flag = true;
                    }
                    sql += f[i].getName() + " = ";
                    if (f[i].getType().getSimpleName().equals("String")) {
                        sql += "'" + aux2 + "'";
                    } else {
                        sql += aux2;
                    }
                }
            } catch (Exception e) {
            }
        }

        System.out.println(sql);
        AFDAL.conecta("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
        AFDAL.executeSelect(sql, obj);
        AFDAL.desconecta();
    }

    public static void update(Object dados, Object chaves) {
        Field[] f = dados.getClass().getDeclaredFields();
        String sql = "Update Tab" + dados.getClass().getSimpleName() + " set ";
        Method mtd;
        String aux1, aux2;
        boolean flag = false;

        for (int i = 0; i < f.length; ++i) {
            try {
                aux1 = "get" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                mtd = dados.getClass().getMethod(aux1);
                aux2 = mtd.invoke(dados).toString();
                if (!aux2.equals("")) {
                    if (flag) {
                        sql += ", ";
                    } else {
                        flag = true;
                    }
                    sql += f[i].getName() + " = ";
                    if (f[i].getType().getSimpleName().equals("String")) {
                        sql += "'" + aux2 + "'";
                    } else {
                        sql += aux2;
                    }
                }
            } catch (Exception e) {
            }
        }

        sql += " where ";
        f = chaves.getClass().getDeclaredFields();
        flag = false;

        for (int i = 0; i < f.length; ++i) {
            try {
                aux1 = "get" + f[i].getName().substring(0, 1).toUpperCase() + f[i].getName().substring(1);
                mtd = chaves.getClass().getMethod(aux1);
                aux2 = mtd.invoke(chaves).toString();
                if (!aux2.equals("")) {
                    if (flag) {
                        sql += " and ";
                    } else {
                        flag = true;
                    }
                    sql += f[i].getName() + " = ";
                    if (f[i].getType().getSimpleName().equals("String")) {
                        sql += "'" + aux2 + "'";
                    } else {
                        sql += aux2;
                    }
                }
            } catch (Exception e) {
            }
        }

        System.out.println(sql);
        AFDAL.conecta("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
        AFDAL.executeSQL(sql);
        AFDAL.desconecta();
    }
}