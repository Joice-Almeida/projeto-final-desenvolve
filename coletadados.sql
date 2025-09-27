-- CATEGORIAS DE TERRENO E TIPOS
SELECT DISTINCT `Land Category`,`Land Class`
FROM `t1engenhariadados.projeto_final_3_3.petroleo_gas`;


-- CLASSES E CATEGORIAS DE TERRENO
SELECT 
  COUNT(DISTINCT `Land Class`) AS total_classes,
  COUNT (DISTINCT `Land Category`) AS total_categorias
FROM `t1engenhariadados.projeto_final_3_3.petroleo_gas`;
  


-- TOTAL DE ESTADOS E CONDADOS 
SELECT 
  COUNT(DISTINCT State) AS estados,
  COUNT(DISTINCT County) AS condados
FROM `t1engenhariadados.projeto_final_3_3.petroleo_gas`;



-- COMMODITIES E VOLUME POR ANO
SELECT `Commodity`,
 EXTRACT(YEAR FROM `Production Date`) AS ano,
 SUM(Volume) AS Volume_total
FROM `t1engenhariadados.projeto_final_3_3.petroleo_gas`
GROUP BY `Commodity`,ano
ORDER BY ano,volume_total DESC;


