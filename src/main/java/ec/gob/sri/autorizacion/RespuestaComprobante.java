
package ec.gob.sri.autorizacion;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para respuestaComprobante complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="respuestaComprobante">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="claveAccesoConsultada" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="numeroComprobantes" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="autorizaciones" minOccurs="0">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element ref="{http://ec.gob.sri.ws.autorizacion}autorizacion" maxOccurs="unbounded" minOccurs="0"/>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "respuestaComprobante", propOrder = {
    "claveAccesoConsultada",
    "numeroComprobantes",
    "autorizaciones"
})
public class RespuestaComprobante {

    protected String claveAccesoConsultada;
    protected String numeroComprobantes;
    protected RespuestaComprobante.Autorizaciones autorizaciones;

    /**
     * Obtiene el valor de la propiedad claveAccesoConsultada.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getClaveAccesoConsultada() {
        return claveAccesoConsultada;
    }

    /**
     * Define el valor de la propiedad claveAccesoConsultada.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setClaveAccesoConsultada(String value) {
        this.claveAccesoConsultada = value;
    }

    /**
     * Obtiene el valor de la propiedad numeroComprobantes.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumeroComprobantes() {
        return numeroComprobantes;
    }

    /**
     * Define el valor de la propiedad numeroComprobantes.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumeroComprobantes(String value) {
        this.numeroComprobantes = value;
    }

    /**
     * Obtiene el valor de la propiedad autorizaciones.
     * 
     * @return
     *     possible object is
     *     {@link RespuestaComprobante.Autorizaciones }
     *     
     */
    public RespuestaComprobante.Autorizaciones getAutorizaciones() {
        return autorizaciones;
    }

    /**
     * Define el valor de la propiedad autorizaciones.
     * 
     * @param value
     *     allowed object is
     *     {@link RespuestaComprobante.Autorizaciones }
     *     
     */
    public void setAutorizaciones(RespuestaComprobante.Autorizaciones value) {
        this.autorizaciones = value;
    }


    /**
     * <p>Clase Java para anonymous complex type.
     * 
     * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;sequence>
     *         &lt;element ref="{http://ec.gob.sri.ws.autorizacion}autorizacion" maxOccurs="unbounded" minOccurs="0"/>
     *       &lt;/sequence>
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "autorizacion"
    })
    public static class Autorizaciones {

        @XmlElement(namespace = "http://ec.gob.sri.ws.autorizacion")
        protected List<Autorizacion> autorizacion;

        /**
         * Gets the value of the autorizacion property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the autorizacion property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getAutorizacion().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link Autorizacion }
         * 
         * 
         */
        public List<Autorizacion> getAutorizacion() {
            if (autorizacion == null) {
                autorizacion = new ArrayList<Autorizacion>();
            }
            return this.autorizacion;
        }

    }

}
