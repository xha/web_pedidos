<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Item
 * 
 * @property int $idItem
 * @property string $codigo
 * @property string $descripcion
 * @property int $idInstancia
 * @property int $idMarca
 * @property int $idUnidadMedida
 * @property float $costo
 * @property float $existencia
 * @property float $minimo
 * @property float $maximo
 * @property bool $esExento
 * @property bool|null $esServicio
 * @property string $ruta
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Instancia $Instancia
 * @property Marca $marca
 * @property UnidadMedida $unidad_medida
 * @property Collection|Carrito[] $carritos
 * @property Collection|Compra[] $compras
 * @property Collection|Inventario[] $inventarios
 * @property Collection|ItemExistencia[] $item_existencia
 * @property Collection|ItemPrecio[] $item_precios
 * @property Collection|VentaItem[] $venta_items
 *
 * @package App\Models
 */
class Item extends Model
{
	protected $table = 'item';
	protected $primaryKey = 'idItem';
	public $timestamps = false;

	protected $casts = [
		'idInstancia' => 'int',
		'idMarca' => 'int',
		'idUnidadMedida' => 'int',
		'costo' => 'float',
		'existencia' => 'float',
		'minimo' => 'float',
		'maximo' => 'float',
		'esExento' => 'bool',
		'esServicio' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool',
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'codigo',
		'descripcion',
		'idInstancia',
		'idMarca',
		'idUnidadMedida',
		'costo',
		'existencia',
		'minimo',
		'maximo',
		'esExento',
		'esServicio',
		'ruta',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo',
	];

	public function instancia()
	{
		return $this->belongsTo(Instancia::class, 'idInstancia');
	}

	public function marca()
	{
		return $this->belongsTo(Marca::class, 'idMarca');
	}

	public function unidad_medida()
	{
		return $this->belongsTo(UnidadMedida::class, 'idUnidadMedida');
	}

	public function carritos()
	{
		return $this->hasMany(Carrito::class, 'idItem');
	}

	public function compras()
	{
		return $this->belongsToMany(Compra::class, 'compra_item', 'idItem', 'idCompra')
					->withPivot('idCompraItem', 'numeroLinea', 'descripcionItem', 'cantidad', 'costo', 'precio', 'impuesto', 'descuento', 'montoTotal', 'esExento', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}

	public function inventarios()
	{
		return $this->belongsToMany(Inventario::class, 'inventario_item', 'idItem', 'idInventario')
					->withPivot('numeroLinea', 'descripcionItem', 'cantidad', 'costo', 'precio', 'impuesto', 'descuento', 'montoTotal', 'esExento', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}

	public function item_existencia()
	{
		return $this->hasMany(ItemExistencia::class, 'idItem');
	}

	public function item_precios()
	{
		return $this->hasMany(ItemPrecio::class, 'idItem');
	}

	public function venta_items()
	{
		return $this->hasMany(VentaItem::class, 'idItem');
	}

	public function precioActual()
	{
		return number_format($this->precio, 2) ;
	}
}
