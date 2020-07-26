<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class VentaItem
 * 
 * @property int $idVentaItem
 * @property int $idVenta
 * @property int $idItem
 * @property int $numeroLinea
 * @property string $descripcionItem
 * @property float $cantidad
 * @property float $costo
 * @property float $precio
 * @property float $impuesto
 * @property float $descuento
 * @property float $montoTotal
 * @property bool $esExento
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Item $item
 * @property Venta $Venta
 * @property Collection|VentaImpuestoItem[] $venta_impuesto_items
 *
 * @package App\Models
 */
class VentaItem extends Model
{
	protected $table = 'venta_item';
	protected $primaryKey = 'idVentaItem';
	public $timestamps = false;

	protected $casts = [
		'idVenta' => 'int',
		'idItem' => 'int',
		'numeroLinea' => 'int',
		'cantidad' => 'float',
		'costo' => 'float',
		'precio' => 'float',
		'impuesto' => 'float',
		'descuento' => 'float',
		'montoTotal' => 'float',
		'esExento' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idVenta',
		'idItem',
		'numeroLinea',
		'descripcionItem',
		'cantidad',
		'costo',
		'precio',
		'impuesto',
		'descuento',
		'montoTotal',
		'esExento',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function item()
	{
		return $this->belongsTo(Item::class, 'idItem');
	}

	public function Venta()
	{
		return $this->belongsTo(Venta::class, 'idVenta');
	}

	public function venta_impuesto_items()
	{
		return $this->hasMany(VentaImpuestoItem::class, 'idVentaItem');
	}
}
