package packclasses;

import java.sql.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
/**
/**
 *
 * @author asenj
 */
public class AFDAL {
private static Connection con;

    public static void conecta(String _bd, String _usuario, String _senha)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bancolivro", "root", "leofur52");
        }
        
        catch (Exception e)
        {
            Erro.setErro(e.getMessage());
        }
    }
    public static void desconecta()
    {
        try 
        {
            con.close();
        }
        catch (Exception e)
        {
            Erro.setErro(e.getMessage());
        }
    }
    public static void executeSQL(String _sql)
    {
        try 
        {
            Statement st = con.createStatement();
            st.executeUpdate(_sql);
            st.close();
        }
        catch(Exception e)
        {
            Erro.setErro(e.getMessage());
        }
    }
    public static void executeSelect(String _sql, Object obj)
    {
        ResultSet rs;
        try
        {
            PreparedStatement st = con.prepareStatement(_sql);
            rs = st.executeQuery();
            if (rs.next())
            {
                Field[] f  = obj.getClass().getDeclaredFields();
                Method mtd;
                String aux;
                for(int i=0; i<f.length; ++i)
                {
                    aux="set"+f[i].getName().substring( 0, 1 ).toUpperCase() + f[i].getName().substring( 1 );
                    try 
                    {
                        mtd = obj.getClass().getMethod(aux, new Class[] {f[i].getType()});
                        mtd.invoke(obj, new Object[] {rs.getString(f[i].getName())});
                    }
                    catch(Exception e){}
                }
            }
            else
            {
                Erro.setErro(obj.getClass().getSimpleName() + " não localizado."); return; 
            }
            st.close();
        }
        catch (Exception e)
        {
            Erro.setErro(e.getMessage());
        }
    }
    
    }