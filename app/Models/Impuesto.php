<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Impuesto
 * 
 * @property int $idImpuesto
 * @property string $descripcion
 * @property float $monto
 * @property bool $esRetencion
 * @property bool $esCompra
 * @property bool $esVenta
 * @property bool $esPorcentaje
 * @property bool $esLibroImpuesto
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Collection|Compra[] $compras
 * @property Collection|CompraImpuestoItem[] $compra_impuesto_items
 * @property Collection|VentaImpuesto[] $venta_impuestos
 * @property Collection|VentaImpuestoItem[] $venta_impuesto_items
 *
 * @package App\Models
 */
class Impuesto extends Model
{
	protected $table = 'impuesto';
	protected $primaryKey = 'idImpuesto';
	public $timestamps = false;

	protected $casts = [
		'monto' => 'float',
		'esRetencion' => 'bool',
		'esCompra' => 'bool',
		'esVenta' => 'bool',
		'esPorcentaje' => 'bool',
		'esLibroImpuesto' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'monto',
		'esRetencion',
		'esCompra',
		'esVenta',
		'esPorcentaje',
		'esLibroImpuesto',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function compras()
	{
		return $this->belongsToMany(Compra::class, 'compra_impuesto', 'idImpuesto', 'idCompra')
					->withPivot('idCompraImpuesto', 'monto', 'montoTasa', 'montoTotal', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}

	public function compra_impuesto_items()
	{
		return $this->hasMany(CompraImpuestoItem::class, 'idImpuesto');
	}

	public function venta_impuestos()
	{
		return $this->hasMany(VentaImpuesto::class, 'idImpuesto');
	}

	public function venta_impuesto_items()
	{
		return $this->hasMany(VentaImpuestoItem::class, 'idImpuesto');
	}
}
